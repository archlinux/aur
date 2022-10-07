# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

pkgname=clad
pkgver=1.0
pkgrel=1
pkgdesc='Enables automatic differentiation for C++'
arch=(x86_64)
license=(LGPL)
url='https://github.com/vgvassilev/clad'
depends=(llvm clang)
makedepends=(cmake)
optdepends=()
source=(https://github.com/vgvassilev/clad/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('9c754bce4d9a1feb3b7e93bd8dc6b747f546b522e7889652ca035ec503f6e12e')

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
