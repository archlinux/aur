# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=uni-algo
pkgver=1.1.0
pkgrel=1
pkgdesc="Unicode Algorithms Implementation for C/C++"
arch=("x86_64")
url="https://github.com/uni-algo/uni-algo"
license=("MIT" "Unlicense")
depends=("gcc-libs")
makedepends=("cmake" "git")
_tag=5c5e2386ac4e85d817cc081abbc62d80fd970a0e # git rev-parse v${pkgver}
source=("${pkgname}-${pkgver}::git+https://github.com/uni-algo/uni-algo.git#tag=${_tag}?signed")
b2sums=("SKIP")
validpgpkeys=(
  "824F52712D0A5D9B2DAA0612C3E259290569D95F" # mg152 <mg152git@gmail.com>, retrieved from https://github.com/mg152.gpg
)

pkgver() {
  git -C "${pkgname}-${pkgver}" describe --tags \
    | sed 's/^v//'
}

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D BUILD_SHARED_LIBS:BOOL="ON" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "${pkgname}-${pkgver}/LICENSE.md"
}
