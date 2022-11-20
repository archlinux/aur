# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgbase=python38-pyqt5
pkgname=('python38-pyqt5')
pkgdesc="A set of Python 3.8 bindings for the Qt5 toolkit"
pkgver=5.15.7
pkgrel=3
arch=('x86_64')
url="https://riverbankcomputing.com/software/pyqt/intro"
license=('GPL')
groups=(pyqt5)
depends=('python38-pyqt5-sip' 'qt5-base')
optdepends=('python38-opengl: enable OpenGL 3D graphics in PyQt applications'
            'python38-dbus: for python-dbus mainloop support'
            'qt5-multimedia: QtMultimedia, QtMultimediaWidgets'
            'qt5-tools: QtHelp, QtDesigner'
            'qt5-svg: QtSvg'
            'qt5-xmlpatterns: QtXmlPatterns'
            'qt5-declarative: QtQml, qmlplugin'
            'qt5-serialport: QtSerialPort'
            'qt5-websockets: QtWebSockets'
            'qt5-connectivity: QtNfc, QtBluetooth'
            'qt5-x11extras: QtX11Extras'
            'qt5-remoteobjects: QtRemoteObjects'
            'qt5-speech: QtTextToSpeech'
            'qt5-quick3d: QtQuick3D'
            'qt5-location: QtLocation, QtPositioning'
            'qt5-sensors: QtSensors'
            'qt5-webchannel: QtWebChannel')
provides=(qt5-python-bindings)
makedepends=('sip' 'pyqt-builder' 'python38-opengl' 'python38-dbus'
             'qt5-connectivity' 'qt5-multimedia' 'qt5-tools' 'qt5-serialport' 'qt5-speech' 'qt5-svg'
             'qt5-websockets' 'qt5-x11extras' 'qt5-xmlpatterns' 'qt5-remoteobjects' 'qt5-quick3d'
             'qt5-sensors' 'qt5-webchannel' 'qt5-location')
conflicts=('pyqt5-common')
source=("https://pypi.python.org/packages/source/P/PyQt5/PyQt5-$pkgver.tar.gz")
sha256sums=('755121a52b3a08cb07275c10ebb96576d36e320e572591db16cfdbc558101594')
options=(debug)

build() {
  cd PyQt5-$pkgver
  sip-build \
    --confirm-license \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python38 \
    --pep484-pyi
  cd build
  make
}

package_python38-pyqt5(){
  cd PyQt5-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install -j1

  # Remove unused py2 version of uic modules:
  rm -r "$pkgdir"/usr/lib/python*/site-packages/PyQt5/uic/port_v2

  # compile Python bytecode
  python3.8 -m compileall -d / "$pkgdir"/usr/lib
  python3.8 -O -m compileall -d / "$pkgdir"/usr/lib
}