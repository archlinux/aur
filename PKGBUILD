# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=prometheus-cpp
pkgver=1.3.0
_tag=v${pkgver}
pkgrel=2
pkgdesc="Prometheus Client Library for Modern C++"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/jupp0r/${pkgname}"
license=("MIT")
depends=(glibc gcc-libs curl zlib benchmark)
makedepends=(cmake)
source=("${pkgname}-${_tag}.tar.gz::https://github.com/jupp0r/${pkgname}/releases/download/${_tag}/${pkgname}-with-submodules.tar.gz")
sha256sums=("62bc2cc9772db2314dbaae506ae2a75c8ee897dab053d8729e86a637b018fdb6")

prepare() {
  if [[ $CARCH == "x86_64" ]]
  then
    _MSHSTK=-DCMAKE_CXX_FLAGS=-mshstk
    echo ${_MSHSTK}
  fi
  cd "${pkgname}-with-submodules"
  mkdir -p build
  cd build
  cmake .. ${_MSHSTK} \
  -DBUILD_SHARED_LIBS=ON \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-z,relro,-z,now,-z,shstk"
}

build() {
  cd "${pkgname}-with-submodules/build"
  cmake --build .
}

check() {
  cd "${pkgname}-with-submodules/build"
  ctest -V -E "benchmarks"
}

package() {
  cd "${pkgname}-with-submodules/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
