# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=KaHIP
pkgname=${_base,,}
pkgver=3.15
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
sha512sums=('3e06a2fd205facc1bd7e19a89ccfc8bb31e66565afff09c7709e9ce0759da3219992c846ba51b900c4b8192dc9fcc037d7ac39d150c9f1b64f53b0a68cd1d67b'
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
