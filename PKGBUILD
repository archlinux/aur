pkgbase=pyqt6
pkgname=('python-pyqt6')
pkgdesc="A set of Python bindings for the Qt6 toolkit"
pkgver=6.0.0
pkgrel=1
arch=('x86_64')
url="https://riverbankcomputing.com/software/pyqt/intro"
license=('GPL')
groups=(pyqt6)
depends=('python-pyqt6-sip' 'qt6-base')
optdepends=('python-opengl: enable OpenGL 3D graphics in PyQt applications'
            'python-dbus: for python-dbus mainloop support'
            'qt6-tools: QtHelp, QtDesigner'
            'qt6-svg: QtSvg'
            'qt6-declarative: QtQml, qmlplugin'
            'qt6-networkauth: QtNetworkAuth')
makedepends=('sip6' 'pyqt-builder' 'python-opengl' 'python-dbus'
             'qt6-tools' 'qt6-svg'
             'qt6-networkauth' 'qt6-quick3d')
source=("https://pypi.python.org/packages/source/P/PyQt6/PyQt6-$pkgver.tar.gz")
sha256sums=('c758b0568127bffd7147f461d74bbf06249177eae908efed8099eec30984f1b3')

prepare () {
  cd PyQt6-$pkgver
  # dbus/dbus.cpp:64:19: error: ‘pyqt6DBusHelper::Watchers’ {aka ‘class QMultiHash<int, pyqt6DBusHelper::Watcher>’} has no member named ‘insertMulti’
  sed -i "s|insertMulti|insert|g" dbus/dbus.cpp
}

build() {
  cd PyQt6-$pkgver
  sip-build \
    --confirm-license \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python --qmake=/usr/bin/qmake-qt6
  cd build
  make
}

package_python-pyqt6(){
  cd PyQt6-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install -j1

  # Remove unused py2 version of uic modules:
  rm -r "$pkgdir"/usr/lib/python*/site-packages/PyQt5/uic/port_v2

  # compile Python bytecode
  python -m compileall -d / "$pkgdir"/usr/lib
  python -O -m compileall -d / "$pkgdir"/usr/lib
}
