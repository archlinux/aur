# Maintainer: Andrew Anderson <andrew.wja@gmail.com>

pkgname=clang90
pkgdesc="C language family frontend for LLVM, version 9.0.1"
pkgver=9.0.1
pkgrel=2
arch=('x86_64')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('llvm90' 'python')
makedepends=('cmake' 'libffi' 'libedit' 'ncurses' 'libxml2')
options=('staticlibs')
source=(https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-$pkgver.src.tar.xz
        https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/clang-$pkgver.src.tar.xz)
sha256sums=('SKIP'
            'SKIP')

build() {
  mkdir "$srcdir/clang-$pkgver.src/build"
  cd "$srcdir/clang-$pkgver.src/build"

  export PATH=/opt/llvm90/bin:$PATH

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm90 \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DBUILD_SHARED_LIBS=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_BUILD_TESTS=OFF \
    -DLLVM_INCLUDE_DOCS=OFF \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  make -j1 -Wno-dev
}

package() {
  cd "$srcdir/clang-$pkgver.src/build"
  DESTDIR="$pkgdir" make install

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
