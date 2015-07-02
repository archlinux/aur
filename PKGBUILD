# Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
pkgname=opentx-companion
pkgver=2.0.17
pkgrel=2
pkgdesc="EEPROM Editor for OpenTX RC transmitter firmwares"
arch=('x86_64')
url="http://www.open-tx.org/"
license=('GPL')
depends=('phonon' 'qt4' 'sdl')
makedepends=('subversion' 'cmake' 'xsd' 'python-pyqt4' 'bc' 'python2' 'avr-gcc' 'avr-libc' 'sed')
provides=('companion')
conflicts=('companion' 'companion9x-svn')
source=(https://github.com/opentx/opentx/archive/$pkgver.tar.gz)
md5sums=('3ff4ec65fd1edadf69a2fa177ecccdd1')

build() {
  sed -i -e 's/env python/env python2.7/' $srcdir/opentx-$pkgver/radio/util/*.py
  sed -i -e 's/@python/@python2.7/' $srcdir/opentx-$pkgver/radio/src/Makefile
  cd $srcdir/opentx-$pkgver/companion
  mkdir lbuild
  cd lbuild
  cmake ../src
  make clean
  make
  sed -i -e 's/Categories=Application/Categories=Development;/' $srcdir/opentx-$pkgver/companion/src/companion.desktop
}

package() {
  cd $srcdir/opentx-$pkgver/companion/
  install -Dm755 lbuild/companion $pkgdir/usr/bin/companion
  install -Dm644 src/companion.desktop $pkgdir/usr/share/applications/companion.desktop
  install -Dm644 src/icon.png $pkgdir/usr/share/icons/companion.png
}