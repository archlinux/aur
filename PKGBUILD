# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=KaHIP
pkgname=${_base,,}
pkgver=3.14
pkgrel=1
pkgdesc="Karlsruhe HIGH Quality Partitioning"
arch=('x86_64')
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(openmpi openmp metis gperftools)
makedepends=(cmake)
optdepends=('gurobi: for ILP solver in ilp_improve')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  gcc-13-compatibility.patch::${url}/pull/124.patch)
sha512sums=('23cf77f6cdd4f93b33e9ae614e953bb74946b5efaaa5849190257ec92ef91b131e7515c0a856a06aa94e8dd80e290e4395541058808e7309ca4c67b9ec53f64c'
  '984553f2a992d8d84c586fa1367ce21b7c71168240302a8d5a4379d356030951dbb0494d01937221b901139f9b364052596c5c1cfeb3f2042a8de8d411bd5d05')

prepare() {
  cd ${_base}-${pkgver}
  # https://github.com/KaHIP/KaHIP/pull/124
  patch -p1 -i ../gcc-13-compatibility.patch
}

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=11 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_base}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type d -empty -delete
}
