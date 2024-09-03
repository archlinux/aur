# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgname=dune-pdelab
_tarver=2.9
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=1
pkgdesc="New generalized discretization module for a wide range of discretization methods"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=(LGPL3 'custom:GPL2 with runtime exception')
depends=('dune-functions>=2.9.0' 'dune-alugrid>=2.9.0' superlu arpackpp suitesparse)
makedepends=('doxygen' 'graphviz' 'eigen')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'eigen: Lightweight C++ template library for vector and matrix math'
  'dune-multidomaingrid: for Multiple-Domain Grid Function Space test for Poisson')
source=(https://gitlab.dune-project.org/pdelab/${pkgname}/-/archive/releases/${_tar})
sha512sums=('57e99a988129dc122e05c129a3c82283f6753f6b88ff91f00f87c72e8b021c53374799e4d1cc2d58937610b25d157d280911756f77e88712a39bbceb068f5ce6')

build() {
  cmake \
    -S ${pkgname}-releases-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Vc=TRUE \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-releases-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
