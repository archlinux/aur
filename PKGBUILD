# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-models
_dunever=2.9.0
pkgver=2023.04
pkgrel=1
pkgdesc="The models module for the Open Porous Media Simulation (OPM) framework"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL3)
depends=("opm-grid>=${pkgver}" "dune-alugrid>=${_dunever}" "dune-localfunctions>=${_dunever}")
makedepends=(cppcheck superlu suitesparse)
optdepends=('dune-fem: for dofmanager support')
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('7a4fd3a236ff09ae75e6512191ab1dab8a4908e570a335cfef3ea723165cc1d875f8b68209ab358211608098b2db42276c5ba3c3a9d18dfea3a9cbb1753038e4')

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
