# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-models
_dunever=2.9.0
pkgver=2023.10
pkgrel=1
pkgdesc="The models module for the Open Porous Media Simulation (OPM) framework"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL3)
depends=("opm-grid>=${pkgver}" "dune-alugrid>=${_dunever}" "dune-localfunctions>=${_dunever}")
makedepends=(cppcheck superlu suitesparse)
optdepends=('dune-fem: for dofmanager support')
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('ff9fef6a918528c3e8f5c6595cd088fbc52475c6ec4729d19c1ac607bab8357637ef6918862b8356b0ea9fcf02365ef598e87ba5874ee282a1de2676a7e569fa')

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
