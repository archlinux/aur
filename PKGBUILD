# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
pkgname=dune-multidomaingrid
_tarver=2.9
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=1
pkgdesc="Meta grid that allows creating multiple subdomains that span only part of the host grid"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=(LGPL3 'custom:GPL2 with runtime exception')
depends=('dune-grid>=2.9.0')
makedepends=(doxygen graphviz)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/releases/${_tar})
sha512sums=('fb76b54d37529c5a138a84af6f63fab34e43ae34accd33406ddfe7522be556f976af8ec4403169e0c5e77db2297090a582b443d40a5061bd233c94dbfd62d95c')

build() {
  cmake \
    -S ${pkgname}-releases-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-releases-${_tarver}/COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
