# Maintainer: Jingbei Li <i@jingbei.li>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('llvm-asserts' 'llvm-asserts-libs')
pkgver=9.0.1
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             'python-sphinx' 'python-recommonmark' 'python-setuptools')
options=('staticlibs')
source=(https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-$pkgver.src.tar.xz)
sha256sums=('00a1ee1f389f81e9979f3a640a01c431b3021de0d42278f6508391a2f0b81c9a')

prepare() {
  cd "$srcdir/llvm-$pkgver.src"
  mkdir build
}

build() {
  cd "$srcdir/llvm-$pkgver.src/build"

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_ENABLE_BINDINGS=OFF \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
    -DLLVM_BINUTILS_INCDIR=/usr/include
  ninja
}

check() {
  cd "$srcdir/llvm-$pkgver.src/build"
  ninja check
}

package_llvm-asserts() {
  pkgdesc="Collection of modular and reusable compiler and toolchain technologies (with assertions enabled)"
  depends=('llvm-asserts-libs' 'perl')
  optdepends=('python-setuptools: for using lit (LLVM Integrated Tester)')
  provides=("llvm=$pkgver")
  conflicts=('llvm')

  cd "$srcdir/llvm-$pkgver.src/build"

  DESTDIR="$pkgdir" ninja install

  # Include lit for running lit-based tests in other projects
  pushd ../utils/lit
  python3 setup.py install --root="$pkgdir" -O1
  popd

  # The runtime libraries go into llvm-asserts-libs
  mv -f "$pkgdir"/usr/lib/lib{LLVM-*.so,LTO.so.*} "$srcdir"

  # Remove files which conflict with llvm-libs
  rm "$pkgdir"/usr/lib/{LLVMgold,lib{LLVM,LTO}}.so

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm-asserts-libs() {
  pkgdesc="LLVM 9 runtime libraries (with assertions enabled)"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')
  provides=("llvm-libs=$pkgver")
  conflicts=('llvm-libs')

  install -d "$pkgdir/usr/lib"
  cp -P "$srcdir"/lib{LLVM-*.so,LTO.so.*} "$pkgdir/usr/lib/"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
