# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgname=dune-pdelab
_tarver=2.8
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=3
pkgdesc="New generalized discretization module for a wide range of discretization methods"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=('dune-functions>=2.8.0' 'dune-alugrid>=2.8.0' 'superlu' 'arpackpp' 'suitesparse')
makedepends=('doxygen' 'graphviz' 'eigen')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'eigen: Lightweight C++ template library for vector and matrix math'
  'dune-multidomaingrid: for Multiple-Domain Grid Function Space test for Poisson')
source=(https://gitlab.dune-project.org/pdelab/${pkgname}/-/archive/releases/${_tar}
  supress-warnings.patch::https://gitlab.dune-project.org/pdelab/${pkgname}/-/commit/475c58bff8f702d0f8929d26a1de339f070e792e.patch
  pk-qk-warnings.patch::https://gitlab.dune-project.org/pdelab/${pkgname}/-/commit/d6479ff18077d8008dd8ca77181f6bb1524f4f0a.patch)
sha512sums=('d639dd7d8289696262b13c848d2b8142e3f8ee1e5a6d440bdb629ae9d9abc57f0bfc2f31d8c17a366f7364c0e3e328c4a30d386e944e5aad4dbad820e7500edf'
  '128791c38bc78db48ff778ec40a9b01edf252ddeb7e624627c7c166d608157b3892a56dd03aad740f2e2584d73ee908659e78092c07dccebc587365556bb8036'
  'aa83770e5ad9e6e8c5e32d3b4b2cd8011c1975d66e29af91781c51ec3597aca50182f54d8d2c4db4d363cc0117974e06fa3f54e71edb5f9634b44a592d5236b5')

prepare() {
  cd ${pkgname}-releases-${_tarver}
  patch -p1 -i ../supress-warnings.patch
  patch -p1 -i ../pk-qk-warnings.patch
}

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
