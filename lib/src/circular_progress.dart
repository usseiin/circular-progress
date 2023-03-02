import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgress extends CustomPainter {
  double? progress;
  double? progressThickness;
  Color? progressColor;
  Color? progressColorBackground;
  Color? backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;

    var c = Offset(width / 2, height / 2);
    var radius = size.shortestSide / 2;
    var thickness = progressThickness ?? .2;

    var backgroundPaint = Paint()
      ..color = progressColorBackground ?? Colors.grey;
    var backgroundPaint2 = Paint()..color = backgroundColor ?? Colors.white;

    var progressPaint = Paint()..color = progressColor ?? Colors.green;

    canvas.drawCircle(c, radius, backgroundPaint);
    canvas.drawArc(
        Rect.fromCenter(
            center: c, width: size.shortestSide, height: size.shortestSide),
        270.toRadian(),
        (progress ?? 0).toRadian(),
        true,
        progressPaint);
    canvas.drawCircle(c, radius * (1 - thickness), backgroundPaint2);
  }

  @override
  bool shouldRepaint(covariant CircularProgress oldDelegate) =>
      oldDelegate.progress != progress;
}

extension ToRadian on num {
  double toRadian() {
    return this * pi / 180;
  }
}
