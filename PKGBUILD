# Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
pkgname=opentx-companion
pkgver=2.1.1
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
md5sums=('5da1a217a41b6f283e137a5f6b222a26')

build() {
  sed -i -e 's/env python/env python2.7/' $srcdir/opentx-$pkgver/radio/util/*.py
  sed -i -e 's/@python/@python2.7/' $srcdir/opentx-$pkgver/radio/src/Makefile
  cd $srcdir/opentx-$pkgver/companion
  mkdir lbuild
  cd lbuild
  cmake ../src
  make clean
  make
  mv $srcdir/opentx-$pkgver/companion/lbuild/companion.desktop $srcdir/opentx-$pkgver/companion/src/companion.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' $srcdir/opentx-$pkgver/companion/src/companion.desktop
  sed -i -e 's/Icon=companion21/Icon=companion/' $srcdir/opentx-$pkgver/companion/src/companion.desktop
  sed -i -e 's/Name=Companion 2.1.1/Name=Companion/' $srcdir/opentx-$pkgver/companion/src/companion.desktop
}

package() {
  cd $srcdir/opentx-$pkgver/companion/
  install -Dm755 lbuild/companion21 $pkgdir/usr/bin/companion21
  install -Dm644 src/companion.desktop $pkgdir/usr/share/applications/companion.desktop
  install -Dm644 src/icon.png $pkgdir/usr/share/icons/companion.png
}