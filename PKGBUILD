# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

# This package does not include OCaml and go bindings. If you need them, please
# post a comment in the AUR.

pkgname=llvm70
pkgdesc="LLVM compiler toolchain, version 7.0 (installed under /opt/llvm70)"
pkgver=7.0.1
pkgrel=3
arch=('x86_64')
url="https://llvm.org/"
license=('NCSA')
depends=('libedit' 'libxml2' 'python')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2' 'python-sphinx')
options=('staticlibs' '!lto')
source=(https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz)
sha256sums=('a38dfc4db47102ec79dcc2aa61e93722c5f6f06f0a961073bd84b78fb949419b')

build() {
  mkdir -p "$srcdir/llvm-$pkgver.src/build"
  cd "$srcdir/llvm-$pkgver.src/build"
  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm70 \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=OFF \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DLLVM_ENABLE_BINDINGS=OFF \
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
