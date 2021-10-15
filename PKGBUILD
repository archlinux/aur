# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-foamgrid
_tarver=2.8
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=1
pkgdesc="Implementation of the dune-grid interface that implements one- and two-dimensional grids in a physical space of arbitrary dimension"
arch=('x86_64')
url="https://www.dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=('dune-grid>=2.8.0')
makedepends=('doxygen' 'graphviz')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/releases/${_tar})
sha512sums=('69fe3a7582a62f06a108e4be2186b5e63880a4c39cefd0754d6c92abf435316d7960ea6ddee10bea725f482ee767afe9695de132c3b8e4fbd5c11a0a3023398d')

prepare() {
  sed -i 's/^Version: '"${pkgver}"'-git/Version: '"${pkgver}"'/' ${pkgname}-releases-${_tarver}/dune.module
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
    -DENABLE_HEADERCHECK=ON \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-releases-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
