# Maintainer: Andrew Anderson <andrew.wja@gmail.com>

pkgname=clang90
pkgdesc="C language family frontend for LLVM, version 9.0.0"
pkgver=9.0.0
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('llvm90' 'python')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2')
conflicts=('clang')
replaces=('clang')
options=('staticlibs')
source=(https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz
        https://releases.llvm.org/$pkgver/cfe-$pkgver.src.tar.xz)
sha256sums=('SKIP'
            'SKIP')

build() {
  mkdir "$srcdir/cfe-$pkgver.src/build"
  cd "$srcdir/cfe-$pkgver.src/build"

  export PATH=/opt/llvm90/bin:$PATH

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm90 \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DBUILD_SHARED_LIBS=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_BUILD_TESTS=OFF \
    -DLLVM_INCLUDE_DOCS=OFF \
    -DLLVM_BUILD_DOCS=OFF \
    -DLLVM_ENABLE_SPHINX=OFF \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  ninja
}

package() {
  cd "$srcdir/cfe-$pkgver.src/build"
  DESTDIR="$pkgdir" ninja install

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
