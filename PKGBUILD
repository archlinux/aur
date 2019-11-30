# Maintainer: Michael Lass <bevan@bi-co.net>

pkgname=llvm70
pkgdesc="LLVM compiler toolchain, version 7.0 (installed under /opt/llvm70)"
pkgver=7.0.1
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('libedit' 'libxml2' 'python2')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2' 'python-sphinx')
options=('staticlibs')
source=(https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz)
sha256sums=('a38dfc4db47102ec79dcc2aa61e93722c5f6f06f0a961073bd84b78fb949419b')

build() {
  mkdir "$srcdir/llvm-$pkgver.src/build"
  cd "$srcdir/llvm-$pkgver.src/build"
  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm70 \
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
    -DLLVM_BINUTILS_INCDIR=/usr/include
  ninja
}

package() {
  cd "$srcdir/llvm-$pkgver.src/build"
  DESTDIR="$pkgdir" ninja install

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
