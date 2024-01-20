# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=uni-algo
pkgver=1.2.0
pkgrel=1
pkgdesc="Unicode Algorithms Implementation for C/C++"
arch=("x86_64")
url="https://github.com/uni-algo/uni-algo"
license=("Unlicense OR MIT")
depends=("gcc-libs")
makedepends=("cmake" "git")
_tag=56710d1297be7db7bbac6d577aedc87ee686334b # git rev-parse v${pkgver}
source=("${pkgname}-${pkgver}::git+https://github.com/uni-algo/uni-algo.git#tag=${_tag}?signed")
b2sums=("SKIP")
validpgpkeys=(
  "5AEDD63DC46F1A7DFC48BA8652A277DA1DBC00DE" # mg152 <mg152git@gmail.com>, retrieved from https://github.com/mg152.gpg
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
