# Maintainer: Justin Vreeland <vreeland.justin@gmail.com>
# Contributor: Streetwalrus <streetwalrus@codewalr.us>
pkgname=sam-ba
pkgver=3.2.3
pkgrel=2
pkgdesc="Atmel SAM Boot Assistant"
arch=('i686' 'x86_64')
url="https://github.com/atmelcorp/sam-ba"
license=('GPL2')
depends=('qt5-base' 'qt5-serialport' 'qt5-declarative')
makedepends=('qt5-tools')
source=("https://github.com/atmelcorp/sam-ba/archive/v$pkgver.tar.gz"
        "0001-Dont-install-thirdparty-libs.patch"
        "0002-Dont-rely-on-applicationDirPath.patch"
        "0003-Use-newer-qt-version.patch"
        )
md5sums=('dc116aab099685b01653f00aa6a6ac00'
         '6b29a65bbc96b608d7628e8a25ae1f50'
         '1fd871ae02809fcbc3095c169f59ce01'
         'd6cccea0c35eb4f5e0852e1ce0d816c6')

prepare() {
  cd "${srcdir}/sam-ba-$pkgver"

  patch -Np1 -i ../0001-Dont-install-thirdparty-libs.patch
  patch -Np1 -i ../0002-Dont-rely-on-applicationDirPath.patch
  patch -Np1 -i ../0003-Use-newer-qt-version.patch
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
  cp -d lib/* ${pkgdir}/usr/lib
  cp -r qml/SAMBA ${pkgdir}/usr/lib/qt/qml

  mkdir -p ${pkgdir}/usr/share/doc/sam-ba
  rm doc/sam-ba.index
  cp -r doc/* examples ${pkgdir}/usr/share/doc/sam-ba

  mkdir -p ${pkgdir}/usr/share/sam-ba
  cp -r metadata ${pkgdir}/usr/share/sam-ba

  echo -e "\n \033[1;31m The qt library that this package uses has been updated past what
  the upstream project supports. Please keep that in mind when reporting issues. \033[0m\n"
}

# vim:set ts=2 sw=2 et:
