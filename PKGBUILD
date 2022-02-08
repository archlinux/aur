# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-grid-glue
pkgver=2.8.0
pkgrel=2
pkgdesc="Transfer data between independent DUNE grids"
arch=('x86_64')
url="https://www.dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=('dune-grid>=2.8.0')
makedepends=('doxygen' 'graphviz')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
_tar="${pkgname}/${pkgname}-${pkgver}.tar.gz"
source=(https://www.dune-project.org/download/${_tar}{,.asc})
sha512sums=('fd828345e2c85465ab06c1c4864ca7c7d3b50bd7a46fe86fa43f4800d37a4f5c904aef68ca86adabd4b650919ad5df30c381ca8849df63ed5ded1807d696b373' 'SKIP')
validpgpkeys=('80E976F14A508A48E9CA3FE9BC372252CA1CF964') # Ansgar <ansgar@debian.org>

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
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
  install -Dm644 ${pkgname}-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
