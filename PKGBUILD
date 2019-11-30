# Maintainer: Michael Lass <bevan@bi-co.net>

pkgname=clang70
pkgdesc="C language family frontend for LLVM, version 7.0 (installed under /opt/llvm70)"
pkgver=7.0.1
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('llvm70' 'python')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2' 'python-sphinx')
options=('staticlibs')
source=(https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz
        https://releases.llvm.org/$pkgver/cfe-$pkgver.src.tar.xz)
sha256sums=('a38dfc4db47102ec79dcc2aa61e93722c5f6f06f0a961073bd84b78fb949419b'
            'a45b62dde5d7d5fdcdfa876b0af92f164d434b06e9e89b5d0b1cbc65dfe3f418')

build() {
  mkdir "$srcdir/cfe-$pkgver.src/build"
  cd "$srcdir/cfe-$pkgver.src/build"

  export PATH=/opt/llvm70/bin:$PATH

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm70 \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DBUILD_SHARED_LIBS=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_INCLUDE_DOCS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  ninja
}

package() {
  cd "$srcdir/cfe-$pkgver.src/build"
  DESTDIR="$pkgdir" ninja install

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
