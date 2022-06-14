# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-models
pkgver=2022.04
pkgrel=1
pkgdesc="C++ simulation framework for porous media flow"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL3)
_dunever=2.8.0
depends=("opm-material>=${pkgver}" "dune-alugrid>=${_dunever}" "dune-istl>=${_dunever}" "dune-localfunctions>=${_dunever}")
makedepends=(cppcheck superlu suitesparse git)
optdepends=('dune-fem: for dofmanager support'
  'opm-grid: for corner grid support')
source=("git+${url}.git?signed#tag=release/${pkgver}/final1")
sha512sums=('SKIP')
validpgpkeys=('ABE52C516431013C5874107C3F71FE0770D47FFB') # Markus Blatt (applied mathematician and DUNE core developer) <markus@dr-blatt.de>

build() {
  cmake \
    -S ${pkgname} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DUSE_MPI=1 \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
