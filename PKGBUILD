# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

pkgname=clad
pkgver=1.1
pkgrel=3
pkgdesc='Enables automatic differentiation for C++'
arch=(x86_64)
license=(LGPL)
url='https://github.com/vgvassilev/clad'
depends=(llvm clang)
makedepends=(cmake python git)
optdepends=()
source=(https://github.com/vgvassilev/clad/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('8931b8dca4bf385423906ed29f4e2ae0cf7c620b5759174015ddec79e6a8577a')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLLVM_DIR=/usr/lib/cmake/llvm \
    -DClang_DIR=/usr/lib/cmake/clang \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -Wno-dev
  cmake --build build
}

check() {
  cd "$srcdir"/build
  CLADLIB="$srcdir"/build/lib/clad.so make check-clad
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
