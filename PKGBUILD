# $Id$
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Sebastian Nowicki <sebnow@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=('llvm50' 'llvm50-libs' 'clang50')
pkgver=5.0.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('cmake' 'libffi' 'python2' 'python2-sphinx' 'libedit' 'swig')
makedepends_x86_64=('gcc-multilib')
options=('staticlibs')
source=(https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz{,.sig}
        https://releases.llvm.org/$pkgver/cfe-$pkgver.src.tar.xz{,.sig}
        0001-GCC-compatibility-Ignore-the-fno-plt-flag.patch
        0002-Enable-SSP-and-PIE-by-default.patch
        disable-llvm-symbolizer-test.patch)
sha256sums=('5fa7489fc0225b11821cab0362f5813a05f2bcf2533e8a4ea9c9c860168807b0'
            'SKIP'
            '135f6c9b0cd2da1aff2250e065946258eb699777888df39ca5a5b4fe5e23d0ff'
            'SKIP'
            'a1ba7fb859ac157c4b4342435cd656e29b1e1d9bddcb8ae0158a91c0a8ba6203'
            '186f2d10b013395f2dd6e1fd3baf4961a2e40c403f115517c9b253682934f50f'
            '6fff47ab5ede79d45fe64bb4903b7dfc27212a38e6cd5d01e60ebd24b7557359')
validpgpkeys=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D'
              '11E521D646982372EB577A1F8F0871F202119294')

prepare() {
  cd "$srcdir/llvm-$pkgver.src"
  mkdir build

  mv "$srcdir/cfe-$pkgver.src" tools/clang

  # Disable test that fails when compiled as PIE
  # https://bugs.llvm.org/show_bug.cgi?id=31870
  patch -Np1 <../disable-llvm-symbolizer-test.patch

  # Enable SSP and PIE by default
  patch -Np1 -d tools/clang <../0001-GCC-compatibility-Ignore-the-fno-plt-flag.patch
  patch -Np1 -d tools/clang <../0002-Enable-SSP-and-PIE-by-default.patch
}

build() {
  cd "$srcdir/llvm-$pkgver.src/build"

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_TOOL_LLGO_BUILD=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DCLANG_INSTALL_SCANBUILD=OFF \
    -DCLANG_INSTALL_SCANVIEW=OFF \
    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
    -DLLVM_BINUTILS_INCDIR=/usr/include 

  make
  make ocaml_doc
  # Disable automatic installation of components that go into subpackages
  sed -i '/clang\/cmake_install.cmake/d' tools/cmake_install.cmake
}

#check() {
#  cd "$srcdir/llvm-$pkgver.src/build"
#  make check-{llvm,clang}
#}

package_llvm50() {
  pkgdesc="Low Level Virtual Machine"
  depends=('llvm50-libs' 'perl')
  conflicts=('llvm')
  cd "$srcdir/llvm-$pkgver.src"

  make -C build DESTDIR="$pkgdir" install
  # The runtime libraries go into llvm-libs
  rm -rf "$pkgdir/usr/lib/ocaml"
  rm -rf "$pkgdir/usr/share/doc/$pkgname/ocaml-html"
  mv -f "$pkgdir"/usr/lib/libLLVM*.so* "$srcdir"
  rm "$pkgdir"/usr/lib/{LLVMgold,libLTO}.so
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm50-libs() {
  pkgdesc="Low Level Virtual Machine (runtime libraries)"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses')
  install -d "$pkgdir/usr/lib"
  cp -P "$srcdir"/libLLVM*.so* $pkgdir/usr/lib/
  rm "$pkgdir"/usr/lib/libLLVM.so
  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_clang50() {
  pkgdesc="C language family frontend for LLVM"
  url="http://clang.llvm.org/"
  depends=('llvm50-libs' 'gcc' 'libxml2')
  optdepends=('openmp: OpenMP support in clang with -fopenmp')
  conflicts=('clang')

  cd "$srcdir/llvm-$pkgver.src"

  make -C build/tools/clang DESTDIR="$pkgdir" install
  install -Dm644 tools/clang/LICENSE.TXT \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
