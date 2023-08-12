# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=doxide
pkgver=0.2.1
pkgrel=2
pkgdesc="Modern documentation for modern C++"
arch=("x86_64")
url="https://doxide.org"
license=("Apache")
depends=("gcc-libs" "libyaml")
makedepends=("cmake" "git")
_tag=1a752ca23115e9cae574681f98215bfc4cbc2e72 # git rev-parse v${pkgver}
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
