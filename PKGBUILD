# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
pkgname=dune-logging
_tarver=2.8
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=2
pkgdesc="A logging framework for Dune"
arch=('x86_64')
url="https://gitlab.dune-project.org/staging/${pkgname}"
license=('custom:BSD-2-clause' 'LGPL3' 'custom:GPL2 with runtime exception')
depends=("dune-common>=${_tarver}" fmt)
makedepends=('doxygen' 'graphviz')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(${url}/-/archive/releases/${_tar}
  fmt9.patch::${url}/-/commit/39e3ca6fad529e44b1d59463af3288870d61e916.patch)
sha512sums=('3b57d0e57c55195ee20be617f308d8294c7fe87ac8b6d5fbc3d03e12229b6a9f331e4391651a6a8876ab2ffa3e147e10bfddae45dd5f700ca1ebe93f7f9b1215'
  'be68c87e075d3bd35b04389928fa637b198fede795e2ea2d90a5e2fc0b39798dbf89ba23eb1895c9754e0cc1ca4f03c97522aeb481f0fd007a9c9f84a6ce93ea')

prepare() {
  # Apply patch for fmt9 compatibilty
  cd ${pkgname}-releases-${_tarver}
  patch -p1 -i ../fmt9.patch
}

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
