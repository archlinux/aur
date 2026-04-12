# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: David Wu <daichuan at dwu21 dot net>

pkgname=lexbor
pkgver=3.0.0
pkgrel=1
pkgdesc='A set of fast, standards-compliant tools for working with modern web technologies — HTML parsing, CSS processing, URL handling, and more.'
arch=(x86_64)
url='https://lexbor.com'
license=('Apache-2.0')
depends=(glibc)
makedepends=(
  git
  cmake
)
source=("git+https://github.com/lexbor/lexbor.git#tag=v${pkgver}")
sha256sums=('b738cffc343868268d59109be5a1378dc854bfc06ddd5564954060398d3016e6')

build() {
  cmake -S "${pkgname}" -B build \
    -DLEXBOR_BUILD_SHARED=ON \
    -DLEXBOR_BUILD_STATIC=OFF \
    -DLEXBOR_BUILD_TESTS=ON \
    -DLEXBOR_BUILD_TESTS_CPP=ON \
    -DLEXBOR_INSTALL_HEADERS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  cd "${pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" NOTICE
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
