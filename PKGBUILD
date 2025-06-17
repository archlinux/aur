# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-upscaling
pkgver=2025.04
pkgrel=1
pkgdesc="Single-phase and steady-state upscaling methods"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL-3.0-or-later)
depends=("opm-grid>=${pkgver}")
makedepends=(gcc-fortran suitesparse superlu)
options=(!emptydirs)
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('51b285c40ad2e5526c65691a3b253f213f48dd63711b328e72545d31471681c0ee8b09518f05b623c212b4d3eb419897cce49dc0d9d2e54b1665772709d039c1')

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
}
