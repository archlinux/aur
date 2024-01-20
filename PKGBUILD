# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=indicators
pkgver=2.3
pkgrel=2
pkgdesc="Activity Indicators for Modern C++"
arch=("any")
url="https://github.com/p-ranav/indicators"
license=("MIT AND LicenseRef-Custom-BSD-3-Clause")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/p-ranav/indicators/archive/v${pkgver}.tar.gz"
        "undeclared_uint8_t.patch")
b2sums=("d81ba95908302c74830bef4aff5b07fe0352c88630bcb5480f7b2701efe20f3d32fc3c2279cbba558be40ece98cbbd8f9f02c1008c915149eb698ac517b58abd"
        "5d25064a734b8eaafb3366ed7cb23487fbe75220fdd34e7d5be23bd81016607a6abac67d91ac9f8062ece4c1652a75b4ac9143d5f987442c99addf0e0b6007f7")

prepare() {
  patch --forward --strip=1 \
    --directory="${pkgname}-${pkgver}" \
    --input="${srcdir}/undeclared_uint8_t.patch"
}

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
