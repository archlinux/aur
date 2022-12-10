# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=opm-models
_dunever=2.9.0
pkgver=2022.10
pkgrel=1
pkgdesc="C++ simulation framework for porous media flow"
arch=(x86_64)
url="https://github.com/OPM/${pkgname}"
license=(GPL3)
depends=("opm-material>=${pkgver}" "dune-alugrid>=${_dunever}" "dune-istl>=${_dunever}" "dune-localfunctions>=${_dunever}" suitesparse)
makedepends=(cppcheck superlu)
optdepends=('dune-fem: for dofmanager support'
  'opm-grid: for corner grid support')
source=(${pkgname}-release-${pkgver}-final.tar.gz::${url}/archive/release/${pkgver}/final.tar.gz)
sha512sums=('6e6c5f7891a34b2284514b69ee252a517200548a4bce8bc41efed4cf3bf44a01b05bc59ff92d31b075bbf42111329d994374e18173a3baa68df4c3e4b4d1be1d')

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
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-release-${pkgver}-final/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
