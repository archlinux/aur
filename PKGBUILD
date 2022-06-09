# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
pkgname=dune-multidomaingrid
_tarver=v2.8.0
_tar="${_tarver}/${pkgname}-${_tarver}.tar.gz"
pkgver=${_tarver/v/}
pkgrel=1
pkgdesc="Meta grid that allows creating multiple subdomains that span only part of the host grid"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=('dune-grid>=2.8.0')
makedepends=('doxygen' 'graphviz')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/${_tar})
sha512sums=('5fcc17678cd7851f3ba477370945ce30117912420aabbe3ea081805b471eca0ce7d0f7d1b314c4f5b44ccb58d68e238e9056c2e8d01813737592f16e31f003bf')

prepare() {
  sed -i 's/^Version: '"${pkgver%.0}"'/Version: '"${pkgver}"'/' ${pkgname}-${_tarver}/dune.module
}

build() {
  cmake \
    -S ${pkgname}-${_tarver} \
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
  install -Dm644 ${pkgname}-${_tarver}/COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
