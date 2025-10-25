# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-upscaling
pkgver=2025.10
pkgrel=1
pkgdesc="Single-phase and steady-state upscaling methods"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL-3.0-or-later)
depends=("opm-grid>=${pkgver}")
makedepends=(gcc-fortran suitesparse superlu)
options=(!emptydirs)
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('4b7ec2fda2684b19523d243f21401047eab9a0fbf6bc9baecf5c5c7503efbe4f5a86b181a14a4c63c04517652d8d4655c4b74378bbf40da5517e355bb6e7ab90')

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
