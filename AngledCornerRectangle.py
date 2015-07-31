# Copyright (c) 2015 Ultimaker B.V.
# Uranium is released under the terms of the AGPLv3 or higher.

from PyQt5.QtCore import pyqtSlot, pyqtProperty, pyqtSignal, PYQT_VERSION
from PyQt5.QtGui import QColor
from PyQt5.QtQuick import QQuickItem, QSGGeometryNode, QSGGeometry, QSGFlatColorMaterial, QSGSimpleRectNode

class AngledCornerRectangle(QQuickItem):
    def __init__(self, parent = None):
        super().__init__(parent)

        self.setFlag(QQuickItem.ItemHasContents)

        self._corner_size = 0
        self._color = QColor(255, 255, 255, 255)

        self._geometry = None
        self._material = None
        self._node = None
        self._attributes = None

    def getCornerSize(self):
        return self._corner_size

    def setCornerSize(self, size):
        if size != self._corner_size:
            self._corner_size = size
            self.update()
            self.cornerSizeChanged.emit()

    cornerSizeChanged = pyqtSignal()
    cornerSize = pyqtProperty(float, fget=getCornerSize, fset=setCornerSize, notify=cornerSizeChanged)

    def setColor(self, color):
        if color != self._color:
            self._color = color
            self.update()
            self.colorChanged.emit()

    colorChanged = pyqtSignal()

    @pyqtProperty(QColor, fset=setColor, notify=colorChanged)
    def color(self):
        return self._color

    def updatePaintNode(self, paint_node, update_data):
        if PYQT_VERSION < 0x050500:
            self._node = QSGGeometryNode()

            attribs = QSGGeometry.defaultAttributes_Point2D()
            self._geometry = QSGGeometry(attribs, 6, 12)
            self._geometry.setDrawingMode(0x0004)
            self._geometry.vertexDataAsPoint2D()[0].set(self._corner_size, 0)
            self._geometry.vertexDataAsPoint2D()[1].set(0, self._corner_size)
            self._geometry.vertexDataAsPoint2D()[2].set(0, self.height())
            self._geometry.vertexDataAsPoint2D()[3].set(self.width() - self._corner_size, self.height())
            self._geometry.vertexDataAsPoint2D()[4].set(self.width(), self.height() - self._corner_size)
            self._geometry.vertexDataAsPoint2D()[5].set(self.width(), 0)

            self._geometry.indexDataAsUShort()[0] = 0
            self._geometry.indexDataAsUShort()[1] = 1
            self._geometry.indexDataAsUShort()[2] = 2

            self._geometry.indexDataAsUShort()[3] = 0
            self._geometry.indexDataAsUShort()[4] = 2
            self._geometry.indexDataAsUShort()[5] = 3

            self._geometry.indexDataAsUShort()[6] = 0
            self._geometry.indexDataAsUShort()[7] = 3
            self._geometry.indexDataAsUShort()[8] = 4

            self._geometry.indexDataAsUShort()[9] = 0
            self._geometry.indexDataAsUShort()[10] = 4
            self._geometry.indexDataAsUShort()[11] = 5

            self._node.setGeometry(self._geometry)

            self._material = QSGFlatColorMaterial()
            self._material.setColor(self._color)

            self._node.setMaterial(self._material)
        else:
            if paint_node is None:
                paint_node = QSGSimpleRectNode()

            paint_node.setRect(0, 0, self.width(), self.height())
            paint_node.setColor(self._color)

        return paint_node
