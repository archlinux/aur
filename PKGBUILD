# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

pkgname=clad
pkgver=2.3
pkgrel=2
pkgdesc='Enables automatic differentiation for C++'
arch=(x86_64)
license=(LGPL)
url='https://github.com/vgvassilev/clad'
depends=(llvm21 clang21)
makedepends=(cmake python git llvm)
optdepends=()
source=("git+https://github.com/vgvassilev/clad#tag=v${pkgver}")
sha256sums=('f165083a84200ffed3365b015546b95aabffc63e0d2221255a25bdd47c903d4c')

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLLVM_DIR=/usr/lib/llvm21/lib/cmake/llvm \
    -DClang_DIR=/usr/lib/llvm21/lib/cmake/clang \
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
