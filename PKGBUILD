# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=doxide
pkgver=0.4.1
pkgrel=1
pkgdesc="Modern documentation for modern C++"
arch=("x86_64")
url="https://doxide.org"
license=("Apache-2.0")
depends=("gcc-libs" "libyaml")
makedepends=("cmake" "git")
_tag=d4925d3d73498cb6fd70f3dcd2a7e63127663252 # git rev-parse v${pkgver}
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
