# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

# ************************************************************************** #
# This package is meant to be used for compiling packages that have not been #
# ported to LLVM 8 yet. Such packages may depend on llvm7-libs but not llvm7 #
# which is not co-installable with the main llvm package (currently LLVM 8). #
# ************************************************************************** #

pkgname=('llvm7' 'llvm7-libs')
pkgver=7.1.0
pkgrel=3
arch=('x86_64')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             'python-setuptools')
options=('staticlibs')
source=(https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz{,.sig}
        rusty-discriminator-thingy.patch
        add-discriminator-to-debuginfo-test.patch)
sha256sums=('1bcc9b285074ded87b88faaedddb88e6b5d6c331dfcfb57d7f3393dd622b3764'
            'SKIP'
            '4abaef845abb899628deb62a3f184fb8433555620648150dc346a74ef134fd68'
            '1d2ea3a07e94f4c826706a452e93ed8a2301b5eed5715d22eab19a5ea3f3d0a7')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/llvm-$pkgver.src"
  mkdir build

  # Fix rust 1.32 segfaults with LTO being enabled
  # https://github.com/rust-lang/rust/issues/54614
  patch -Np1 -i ../rusty-discriminator-thingy.patch
  patch -Np1 -i ../add-discriminator-to-debuginfo-test.patch
}

build() {
  cd "$srcdir/llvm-$pkgver.src/build"

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
    -DLLVM_BINUTILS_INCDIR=/usr/include
  ninja
}

check() {
  cd "$srcdir/llvm-$pkgver.src/build"
  ninja check
}

package_llvm7() {
  pkgdesc="Collection of modular and reusable compiler and toolchain technologies"
  depends=('llvm7-libs' 'perl')
  optdepends=('python-setuptools: for using lit (LLVM Integrated Tester)')
  conflicts=('llvm')

  cd "$srcdir/llvm-$pkgver.src/build"

  DESTDIR="$pkgdir" ninja install

  # Include lit for running lit-based tests in other projects
  pushd ../utils/lit
  python3 setup.py install --root="$pkgdir" -O1
  popd

  # The runtime libraries go into llvm7-libs
  mv -f "$pkgdir"/usr/lib/lib{LLVM-*.so,LTO.so.*} "$srcdir"

  # Remove files which conflict with llvm-libs
  rm "$pkgdir"/usr/lib/{LLVMgold,lib{LLVM,LTO}}.so

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm7-libs() {
  pkgdesc="LLVM 7 runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')

  install -d "$pkgdir/usr/lib"
  cp -P "$srcdir"/lib{LLVM-*.so,LTO.so.*} "$pkgdir/usr/lib/"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
