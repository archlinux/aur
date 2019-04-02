# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_basename=cmocka
pkgname=lib32-cmocka
pkgver=1.1.5
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects'
url='https://cmocka.org/'
arch=('i686' 'x86_64')
license=('Apache')
depends=('lib32-glibc' 'cmocka')
makedepends=('cmake')
source=(https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.{xz,xz.asc})
sha512sums=('cad7f04757183d004f6eaad39036fc0e24c5e0e987f80e85bc43bc66dba22389cb02b08e25531cc28a541d0a24a86b29be134a2d6fc339128e87d66952f502bd'
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
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
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
# mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32 
}

# vim: ts=2 sw=2 et:
