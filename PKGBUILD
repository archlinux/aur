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
  '7e21a09c0f4cdddf994ad381a6bdeb9e072fd82411a55150eb804349e8b3b553293c540549bc7fb1676823072bc0f6159c53a71ad8fb640a5fb74cb044021f59'
  '82dde295880bc0a4f8477e36376415e20977278186e5407966a64720f3420d160c6a87272ff2763f8e36d0436e961069594322ab68c7f3900dae46b9251d4ca5')

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
