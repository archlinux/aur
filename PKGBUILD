# Maintainer: Hex Ripley <hex@punk.lgbt>

pkgbase=pyqt5-extra-modules
pkgname=('python-pyqt5-extra-modules')
pkgdesc="Extra Qt5 module bindings for PyQt5 (WebSockets, Bluetooth, NFC, RemoteObjects, Quick3D, WebChannel) formerly found in python-pyqt5."
pkgver=5.15.11
pkgrel=1
arch=('x86_64')
url="https://riverbankcomputing.com/software/pyqt/intro"
license=('GPL')
groups=(pyqt5)
depends=('python-pyqt5' 'python-pyqt5-sip' 'qt5-base')
optdepends=('qt5-websockets: QtWebSockets'
            'qt5-connectivity: QtNfc, QtBluetooth'
            'qt5-remoteobjects: QtRemoteObjects'
            'qt5-quick3d: QtQuick3D'
            'qt5-webchannel: QtWebChannel')
makedepends=('sip' 'pyqt-builder'
             'qt5-websockets' 'qt5-connectivity' 'qt5-remoteobjects' 'qt5-quick3d' 'qt5-webchannel')
source=("https://pypi.python.org/packages/source/P/PyQt5/PyQt5-$pkgver.tar.gz")
sha256sums=('fda45743ebb4a27b4b1a51c6d8ef455c4c1b5d610c90d2934c7802b5c1557c52')

build() {
  cd PyQt5-$pkgver
  sip-build \
    --confirm-license \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python \
    --pep484-pyi
  cd build
  # Only build the extra modules we want to package
  make -C QtWebSockets
  make -C QtNfc
  make -C QtBluetooth
  make -C QtRemoteObjects
  make -C QtQuick3D
  make -C QtWebChannel
}

package_python-pyqt5-extra-modules(){
  cd PyQt5-$pkgver/build

  # Only install the extra modules
  make -C QtWebSockets INSTALL_ROOT="$pkgdir" install
  make -C QtNfc INSTALL_ROOT="$pkgdir" install
  make -C QtBluetooth INSTALL_ROOT="$pkgdir" install
  make -C QtRemoteObjects INSTALL_ROOT="$pkgdir" install
  make -C QtQuick3D INSTALL_ROOT="$pkgdir" install
  make -C QtWebChannel INSTALL_ROOT="$pkgdir" install

  # compile Python bytecode
  python -m compileall -d / "$pkgdir"/usr/lib
  python -O -m compileall -d / "$pkgdir"/usr/lib
}
