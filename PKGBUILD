# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_basename=cmocka
pkgname=lib32-cmocka
pkgver=1.1.1
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects'
url='https://cmocka.org/'
arch=('i686' 'x86_64')
license=('Apache')
depends=('lib32-glibc')
makedepends=('cmake')
source=(https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.{xz,asc})
sha512sums=('801c4a3e1bb9047241b1cb5a90c1cbdee1b0aff5e3d0a84ec8b2dbaee79274618c24fbe5e9fedbf0b3ee18c6c98b55d93e135d037ac33ab872edc7665af41577'
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
