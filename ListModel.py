# Copyright (c) 2015 Ultimaker B.V.
# Uranium is released under the terms of the AGPLv3 or higher.

from PyQt5.QtCore import QObject, QAbstractListModel, QVariant, QModelIndex, pyqtSlot, pyqtProperty, QByteArray

##  Convenience base class for models of a list of items.
#
#   This class represents a list of dictionary objects that
#   can be exposed to QML. It is intended primarily as a read-only
#   convenience class but supports removing elements so can also be
#   used for limited writing.
class ListModel(QAbstractListModel):
    def __init__(self, parent = None):
        super().__init__(parent)
        self._items = []
        self._role_names = {}

    ##  Reimplemented from QAbstractListModel
    @pyqtSlot(result=int)
    def rowCount(self, parent = None):
        return len(self._items)

    def addRoleName(self,role,name):
        # Qt roleNames expects a QByteArray. PyQt 5.5 does not convert str to bytearray implicitly so
        # force the conversion manually.
        self._role_names[role] = name.encode("utf-8")

    def roleNames(self):
        return self._role_names

    ##  Reimplemented from QAbstractListModel
    def data(self, index, role):
        if not index.isValid():
            return QVariant()
        return self._items[index.row()][self._role_names[role].decode("utf-8")]

    ##  Get an item from the list
    @pyqtSlot(int, result="QVariantMap")
    def getItem(self, index):
        return self._items[index]

    ##  The list of items in this model.
    @pyqtProperty("QVariantList")
    def items(self):
        return self._items

    ##  Add an item to the list.
    @pyqtSlot(dict)
    def appendItem(self, item):
        self.insertItem(len(self._items), item)

    ##  Insert an item into the list at an index.
    #   \param index The index where to insert.
    #   \param item The item to add.
    @pyqtSlot(int, dict)
    def insertItem(self, index, item):
        self.beginInsertRows(QModelIndex(), index, index)
        self._items.insert(index, item)
        self.endInsertRows()

    ##  Remove an item from the list.
    #   \param index The index of the item to remove.
    @pyqtSlot(int)
    def removeItem(self, index):
        self.beginRemoveRows(QModelIndex(), index, index)
        del self._items[index]
        self.endRemoveRows()

    ##  Clear the list.
    @pyqtSlot()
    def clear(self):
        self.beginResetModel()
        self._items.clear()
        self.endResetModel()

    @pyqtSlot(int, str, QVariant)
    def setProperty(self, index, property, value):
        self._items[index][property] = value
        self.dataChanged.emit(self.index(index, 0), self.index(index, 0))

    ##  Sort the list.
    #   \param fun The callable to use for determining the sort key.
    def sort(self, fun):
        self._items.sort(key = fun)

    ##  Find a entry by key value pair
    #   \param key
    #   \param value
    #   \return index of setting if found, None otherwise
    def find(self, key, value):
        for i in range(len(self._items)):
            if key in self._items[i]:
                if self._items[i][key] == value:
                    return i
        return -1
