# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-models
_dunever=2.9.1
pkgver=2024.04
pkgrel=1
pkgdesc="The models module for the Open Porous Media Simulation (OPM) framework"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL-3.0-or-later)
depends=("opm-grid>=${pkgver}" "dune-alugrid>=${_dunever}" "dune-localfunctions>=${_dunever}")
makedepends=(cppcheck superlu suitesparse)
optdepends=('dune-fem: for dofmanager support')
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('d57c775dad372153bb06aac129c33a0c32ba93a33a506dfd52a6defadbf5ed25ed8c5ea8b2ad92766729dbfdf993f8758aaa478f87088b849b19b625e415adb7')

build() {
  export PATH="${srcdir}/${pkgname}-release-${pkgver}-final/bin:${PATH}"
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
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-release-${pkgver}-final/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
