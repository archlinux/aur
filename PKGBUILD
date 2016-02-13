# Maintainer: Nicolas Cornu <ncornu@aldebaran.com>

pkgname=libqi
pkgver=2.5.0.176
pkgrel=1
pkgdesc="Qi library from Aldebaran"
arch=('i686' 'x86_64')
url="https://github.com/aldebaran/libqi"
license=('BSD3')
depends=('boost')
options=('strip' 'staticlibs')
makedepends=('qibuild')
source=("${url}/archive/v${pkgver}.tar.gz"
        "0001-Fix-ambiguous-use-of-relative-due-to-ADL-with-boost.patch"
        "0001-Use-std-is_same-instead-of-boost-s-one.patch")

sha1sums=('9a082e8cf814aa5f19d5b7d4c5b370aec583ea2c'
          '0bded2e9883ae1dc206001126d43f280050f82c9'
          '2be8ae48fd4b0275cddc8fc2d9685676d526a405')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -p1 -i "$srcdir/0001-Fix-ambiguous-use-of-relative-due-to-ADL-with-boost.patch"
  patch -p1 -i "$srcdir/0001-Use-std-is_same-instead-of-boost-s-one.patch"
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p BUILD && cd BUILD
  cmake .. -DQI_WITH_TESTS=OFF -DQI_DIR=../sdk/cmake -DWITH_PROBES=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/BUILD
  make install DESTDIR=${pkgdir}
}
