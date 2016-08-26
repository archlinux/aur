# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Previous Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Arnaud
pkgname=opentx-companion
pkgver=2.1.8
pkgrel=2
pkgdesc="EEPROM Editor for OpenTX RC transmitter firmwares"
arch=('x86_64')
url="http://www.open-tx.org/"
license=('GPL')
depends=('phonon' 'qt4' 'sdl')
makedepends=('cmake' 'xsd' 'python-pyqt4' 'bc' 'python' 'avr-gcc' 'avr-libc' 'sed')
provides=('companion')
conflicts=('companion' 'companion9x-svn')
source=("https://github.com/opentx/opentx/archive/$pkgver.tar.gz"
    'opentx-2.1.8-gcc6.patch'
)
md5sums=('c5c8eb1c3ab072523826da71b6940ae0'
    '155d6672478d3d80400b46ded6edc856'
)

build() {
  cd $srcdir/opentx-$pkgver/companion
  mkdir -p lbuild
  cd lbuild
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../src
  make
}

prepare() {
  cd $srcdir/opentx-$pkgver
  patch -p1 -i ../opentx-2.1.8-gcc6.patch
}

package() {
  cd $srcdir/opentx-$pkgver/companion/lbuild
  make DESTDIR=$pkgdir/ install
  cd $pkgdir/usr/share/applications
  sed -i -e 's/Categories=Application/Categories=Development;/' companion21.desktop
  sed -i -e 's/Categories=Application/Categories=Development;/' simulator21.desktop
  rm -Rf $pkgdir/lib
}
