# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

pkgname=clad
pkgver=1.1
pkgrel=1
pkgdesc='Enables automatic differentiation for C++'
arch=(x86_64)
license=(LGPL)
url='https://github.com/vgvassilev/clad'
depends=(llvm clang)
makedepends=(cmake)
optdepends=()
source=(https://github.com/vgvassilev/clad/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('8931b8dca4bf385423906ed29f4e2ae0cf7c620b5759174015ddec79e6a8577a')

prepare () {
  if [ ! -d "$srcdir"/build ]; then
    mkdir "$srcdir"/build
  fi
}

build() {
  cd "$srcdir"/build
  cmake "$srcdir"/clad-${pkgver} \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_DIR=/usr/lib/cmake/llvm \
    -DClang_DIR=/usr/lib/cmake/clang \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
  make
}

check() {
  cd "$srcdir"/build
  CLADLIB="$srcdir"/build/lib/clad.so make check-clad
}

package() {
  cd "$srcdir"/build
  make install
}
