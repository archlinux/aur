# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=sam-ba
pkgver=3.1.4
pkgrel=1
pkgdesc="Atmel SAM Boot Assistant"
arch=('i686' 'x86_64')
url="https://github.com/atmelcorp/sam-ba"
license=('GPL2')
depends=('qt5-base' 'qt5-serialport' 'qt5-declarative')
source=("https://github.com/atmelcorp/sam-ba/archive/v$pkgver.tar.gz"
        "0001-Dont-install-thirdparty-libs.patch"
        "0002-Dont-rely-on-applicationDirPath.patch")
md5sums=('54d7332f4463e0ca9cf7fa83864f9fe7'
         '6b29a65bbc96b608d7628e8a25ae1f50'
         '41b845c88f5c389b01690baeb78ad9e1')

prepare() {
  cd "${srcdir}/sam-ba-$pkgver"

  patch -Np1 -i ../0001-Dont-install-thirdparty-libs.patch
  patch -Np1 -i ../0002-Dont-rely-on-applicationDirPath.patch
  sed -i -e "s/ jlink//" src/plugins/connection/connection.pro
}

build() {
  cd "${srcdir}/sam-ba-$pkgver"

  mkdir -p build
  cd build

  qmake ../sam-ba.pro
  make -j1
}

package() {
  cd "${srcdir}/sam-ba-$pkgver/build"

  make install INSTALL_ROOT="$PWD/install"

  cd install

  mkdir -p ${pkgdir}/usr/bin
  cp sam-ba ${pkgdir}/usr/bin

  mkdir -p ${pkgdir}/usr/lib/qt/qml
  cp lib/* ${pkgdir}/usr/lib
  cp -r qml/SAMBA ${pkgdir}/usr/lib/qt/qml

  mkdir -p ${pkgdir}/usr/share/doc/sam-ba
  rm doc/sam-ba.index
  cp -r doc/* examples ${pkgdir}/usr/share/doc/sam-ba

  mkdir -p ${pkgdir}/usr/share/sam-ba
  cp -r metadata ${pkgdir}/usr/share/sam-ba
}

# vim:set ts=2 sw=2 et:
