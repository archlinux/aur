# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=indicators
pkgver=2.3
pkgrel=1
pkgdesc="Activity Indicators for Modern C++"
arch=("any")
url="https://github.com/p-ranav/indicators"
license=("MIT")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/p-ranav/indicators/archive/v${pkgver}.tar.gz")
b2sums=("d81ba95908302c74830bef4aff5b07fe0352c88630bcb5480f7b2701efe20f3d32fc3c2279cbba558be40ece98cbbd8f9f02c1008c915149eb698ac517b58abd")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  cd "${pkgname}-${pkgver}/"
  python "./utils/amalgamate/amalgamate.py" \
    --config "./single_include.json" \
    --source "./"
  install -D --target-directory="${pkgdir}/usr/include/${pkgname}/" \
    --mode=644 \
    "./single_include/indicators/indicators.hpp"
}
