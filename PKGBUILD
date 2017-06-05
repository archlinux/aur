# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud
pkgname=opentx-companion
pkgver=2.2.0
pkgrel=1
pkgdesc="EEPROM Editor for OpenTX RC transmitter firmwares"
arch=('x86_64')
url="http://www.open-tx.org/"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'sdl')
makedepends=('cmake' 'xsd' 'bc' 'python' 'avr-gcc' 'avr-libc' 'sed' 'qt5-tools' 'python-pyqt5')
provides=('companion')
conflicts=('companion' 'companion9x-svn')
source=("https://github.com/opentx/opentx/archive/$pkgver.tar.gz"
    "cmake_version.diff"
)
sha256sums=(
    '27a07efcbb7d5759bafea7d8a6d97f910c2830881c0d4c71cbbc7da65446b2cd'
    '3c2777a7f5261851150652dd0c15aa8900c5f07ab20b19322e6be7dc5450d3c4'
)

build() {
  cd $srcdir/opentx-$pkgver
  patch -p1 -i ${srcdir}/cmake_version.diff

  mkdir -p lbuild
  cd lbuild
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DFIRMWARE_TARGET=OFF ../
  make
}


package() {
  cd $srcdir/opentx-$pkgver/lbuild
  make DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Development;/' companion22.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator22.desktop
  rm -Rf $pkgdir/lib
}
