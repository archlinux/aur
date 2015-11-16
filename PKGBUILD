# Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud
pkgname=opentx-companion
pkgver=2.1.6
pkgrel=1
pkgdesc="EEPROM Editor for OpenTX RC transmitter firmwares"
arch=('x86_64')
url="http://www.open-tx.org/"
license=('GPL')
depends=('phonon' 'qt4' 'sdl')
makedepends=('subversion' 'cmake' 'xsd' 'python2-pyqt4' 'bc' 'python2' 'avr-gcc' 'avr-libc' 'sed')
provides=('companion')
conflicts=('companion' 'companion9x-svn')
source=(https://github.com/opentx/opentx/archive/$pkgver.tar.gz)
md5sums=('c90c4c852dd188e60cea683e97a4a6b8')

build() {
  sed -i -e 's/env python/env python2.7/' $srcdir/opentx-$pkgver/radio/util/*.py
  sed -i -e 's/@python/@python2.7/' $srcdir/opentx-$pkgver/radio/src/Makefile
  cd $srcdir/opentx-$pkgver/companion
  mkdir -p lbuild
  cd lbuild
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../src
  make
}

package() {
  cd $srcdir/opentx-$pkgver/companion/lbuild
  make DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Development;/' companion21.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator21.desktop
  rm -Rf $pkgdir/lib
}
