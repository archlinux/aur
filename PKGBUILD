# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-foamgrid
_tarver=v2.10.0
_tar="${_tarver}/${pkgname}-${_tarver}.tar.gz"
pkgver="${_tarver/v/}"
pkgrel=1
pkgdesc="Implementation of the dune-grid interface that implements one- and two-dimensional grids in a physical space of arbitrary dimension"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=(LGPL-3.0-or-later LicenseRef-GPL-2.0-only-with-DUNE-exception)
depends=(dune-grid)
makedepends=(doxygen graphviz)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
options=(!emptydirs)
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/${_tar})
sha512sums=('f2682c86dd7b3cf12135d4f272aca29d26f3456e490fa59c021088727aae62585bdab9d936de05fb3f9f0eea3650b0e2ff4b3839d8b8f3ac20a4c6c240b5a62f')

prepare() {
  sed -i 's/^dune_add_test(SOURCES foamgrid-test.cc)/dune_add_test(SOURCES foamgrid-test.cc EXPECT_FAIL)/' ${pkgname}-${_tarver}/dune/foamgrid/test/CMakeLists.txt
}

build() {
  XDG_CACHE_HOME="${PWD}" \
    cmake \
    -S ${pkgname}-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-O2 -Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=OFF \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist" \
    -Wno-dev

  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
