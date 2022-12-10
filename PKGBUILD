# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-upscaling
_dunever=2.9.0
pkgver=2022.10
pkgrel=1
pkgdesc="Porous media upscaling tools"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL3)
depends=("opm-grid>=${pkgver}")
makedepends=(gcc-fortran suitesparse superlu)
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('b65e164f7ee4d5d881b6bc322fc0d12bad1705c23f0fbe42fc9a0efea96ce1582f98f709ebc7d8a1f7ac8131f97e456c2b9e4a9c591b40c7d10f14ce65ee7368')

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
