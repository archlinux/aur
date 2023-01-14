# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-grid-glue
pkgver=2.9.0
pkgrel=1
pkgdesc="Transfer data between independent DUNE grids"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=("dune-grid>=${pkgver}")
makedepends=(doxygen graphviz)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
_tar="${pkgname}/${pkgname}-${pkgver}.tar.gz"
source=(https://dune-project.org/download/${_tar}{,.asc})
sha512sums=('6bef42ec159bfa8113d1ce008a6b153c484ebe0372da078c3eea29cb53a076450ddd0a40ff0786c47c991380ea4b80b9d9efc3af46d183841bc6e1ae19c397fc'
  'SKIP')
validpgpkeys=('33EE4AA14D584BFA72AFD02D87682820AADECB71') # Ansgar Burchardt <ansgar.burchardt@tu-dresden.de>

prepare() {
  sed -i 's/^Version: '"${pkgver%%.0}"'/Version: '"${pkgver}"'/' ${pkgname}-${pkgver}/dune.module
}

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
