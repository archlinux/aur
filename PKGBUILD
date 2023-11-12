# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-grid
_dunever=2.9.0
pkgver=2023.10
pkgrel=1
pkgdesc="DUNE module supporting grids in a corner-point format"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL3)
depends=("opm-common>=${pkgver}" "dune-grid>=${_dunever}" "dune-istl>=${_dunever}" suitesparse zoltan)
makedepends=(cppcheck doxygen graphviz)
optdepends=('man-db: manual pages for grdecl2vtu and mirror_grid')
provides=('grdecl2vtu' 'mirror_grid')
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('caf3881f08736fb40179d9091dda363ba523636bc44185e607f00774f6d3bbed5d64710bb3afc7167f1cfbe70a5e82f0f9ba9f0f028b7b77d7af5c35dfff7ce0')

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
  find "${pkgdir}" -type d -empty -delete
}
