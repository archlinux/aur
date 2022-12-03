# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=duma-git
pkgver=2.5.24b1.r25.g2aab759
pkgrel=1
pkgdesc="Detect Unintended Memory Access (D.U.M.A.) -
         A Red-Zone memory allocator"
arch=("x86_64")
url="https://github.com/johnsonjh/duma"
license=("GPL2" "LGPL2.1")
depends=("bash")
makedepends=("cmake" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/johnsonjh/duma#branch=master")
b2sums=("SKIP")

pkgver() {
  printf "%s" \
    $(git -C "${pkgname}" describe --long --tags \
      | sed "s/^VERSION_//;s/_BETA_/b/;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g")
}

build() {
  # Intentionally disable the makepkg.conf options
  # since the library requires a debug build
  cmake -B "build/" -S "${pkgname}" \
    -D BUILD_TESTS:BOOL="OFF" \
    -D BUILD_EXAMPLES:BOOL="OFF" \
    -D CMAKE_C_FLAGS:STRING="-fmacro-prefix-map=${srcdir}/=" \
    -D CMAKE_CXX_FLAGS:STRING="-fmacro-prefix-map=${srcdir}/=" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}
