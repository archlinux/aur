# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_basename=cmocka
pkgname=lib32-cmocka
pkgver=1.1.3
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects'
url='https://cmocka.org/'
arch=('i686' 'x86_64')
license=('Apache')
depends=('lib32-glibc' 'cmocka')
makedepends=('cmake')
source=(https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.{xz,xz.asc})
sha512sums=('b1a2ce72234256d653eebf95f8744a34525b9027e1ecf6552e1620c83a4bdda8b5674b748cc5fd14abada1e374829e2e7f0bcab0b1c8d6c3b7d9b7ec474b6ed3'
            'SKIP')
validpgpkeys=('8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D') # Andreas Schneider <asn@cryptomilk.org>

prepare() {
  cd ${_basename}-${pkgver}
  rm build -Rf
  mkdir build
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_basename}-${pkgver}/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUNIT_TESTING=ON
  make
}

check() {
  cd ${_basename}-${pkgver}/build
  make test
}

package() {
  cd ${_basename}-${pkgver}/build
  make install DESTDIR="${pkgdir}"
  rm ${pkgdir}/usr/include -Rf
  mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32 
}

# vim: ts=2 sw=2 et:
