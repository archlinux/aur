# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-upscaling
_dunever=2.9.0
pkgver=2023.10
pkgrel=1
pkgdesc="Single-phase and steady-state upscaling methods"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL3)
depends=("opm-grid>=${pkgver}")
makedepends=(gcc-fortran suitesparse superlu)
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('c73bba05a4e07344f767a926672d1b4de8ab8a49d7cfa06e3e29e4b522b9bdedc48b16400f86b56836b85975bde7cc6ccea9e6b33cf208450c731d67fbebed0c')

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
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-release-${pkgver}-final/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
