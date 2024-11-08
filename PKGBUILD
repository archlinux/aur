# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-upscaling
pkgver=2024.10
pkgrel=1
pkgdesc="Single-phase and steady-state upscaling methods"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL-3.0-or-later)
depends=("opm-grid>=${pkgver}")
makedepends=(gcc-fortran suitesparse superlu)
options=(!emptydirs)
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('cf0de91e6a1eb04146d8e8688fe72e3bdedf5fe7a2c8d8290bf00cf74f3f1737f2be3b41b16ccbc8926417b767e6ad0d720cb50ecc48143566adfe991849428a')

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
