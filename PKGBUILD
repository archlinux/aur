# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-grid
_dunever=2.10.0
pkgver=2024.10
pkgrel=1
pkgdesc="DUNE module supporting grids in a corner-point format"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL-3.0-or-later)
depends=("opm-common>=${pkgver}" "dune-grid>=${_dunever}" "dune-istl>=${_dunever}" suitesparse zoltan)
makedepends=(cppcheck doxygen graphviz)
optdepends=('man-db: manual pages for grdecl2vtu and mirror_grid')
provides=('grdecl2vtu' 'mirror_grid')
options=(!emptydirs)
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('41600c23f63ba5368ede6d805ef40873cad1afa221cedf002ca2ae02eda6b610f9cf1dca83fe7fa7a51ee44cf461a1f317376287e1bf6c98ac6a4763844f8a4a')

build() {
  cmake \
    -S ${pkgname}-release-${pkgver}-final \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DUSE_MPI=1 \
    -DBUILD_EXAMPLES=OFF \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install install-html
  install -Dm644 ${pkgname}-release-${pkgver}-final/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
