# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-foamgrid
_tarver=2.9
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=1
pkgdesc="Implementation of the dune-grid interface that implements one- and two-dimensional grids in a physical space of arbitrary dimension"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=("dune-grid>=${pkgver}")
makedepends=(doxygen graphviz)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/releases/${_tar})
sha512sums=('c9e474c7c958cb43ed5a7df91b044bb332654482a7630f2737a41ce1b8936801513a302d70b810c87c8a81167532524f3498873839d0514d796585cc12943c0d')

prepare() {
  sed -i 's/^Version: '"${pkgver}"'-git/Version: '"${pkgver}"'/' ${pkgname}-releases-${pkgver}/dune.module
  sed -i 's/^  dune_add_test(SOURCES foamgrid-test.cc)/  dune_add_test(SOURCES foamgrid-test.cc EXPECT_FAIL)/' ${pkgname}-releases-${pkgver}/dune/foamgrid/test/CMakeLists.txt
}

build() {
  XDG_CACHE_HOME="${PWD}" \
    cmake \
    -S ${pkgname}-releases-${pkgver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-O2 -Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DALLOW_CXXFLAGS_OVERWRITE=ON \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=OFF \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist" \
    -Wno-dev

  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-releases-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
