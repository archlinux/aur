# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=doxide
pkgver=0.8.0
pkgrel=1
pkgdesc="Modern documentation for modern C++"
arch=("x86_64")
url="https://doxide.org"
license=("Apache-2.0")
depends=("gcc-libs" "libyaml")
makedepends=("cmake" "git" "icu")
_tag=7e4f0733f65e34ac5c761db89e3eba8f23fd45fd # git rev-parse v${pkgver}
source=("${pkgname}-${pkgver}::git+https://github.com/lawmurray/doxide.git#tag=${_tag}")
b2sums=("SKIP")

pkgver() {
  git -C "${pkgname}-${pkgver}" describe --tags \
    | sed 's/^v//'
}

prepare() {
  git -C "${pkgname}-${pkgver}" submodule update \
    --depth=1 --init --recursive
}

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_CXX_FLAGS_RELEASE:STRING="-DNDEBUG" \
    -D CMAKE_C_FLAGS_RELEASE:STRING="-DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}
