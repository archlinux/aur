# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lld16
pkgver=16.0.6
pkgrel=1
pkgdesc="Linker from the LLVM project (version 16)"
arch=('x86_64')
url="https://lld.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm16-libs' 'gcc-libs' 'zlib' 'zstd')
makedepends=('llvm16' 'cmake' 'ninja' 'python')
checkdepends=('llvm')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/lld-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/libunwind-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('a127e334dd267f2e20d5a0c6b15aa9651f3fbbdfe3dc7d2573c617fad1155fcb'
            'SKIP'
            'e91db44d1b3bb1c33fcea9a7d1f2423b883eaa9163d3d56ca2aa6d2f0711bc29'
            'SKIP'
            '7e04070aee07e43ecb5f2b321a7cc64671202af3bcf15324bb1e134cdb7b2b72'
            'SKIP'
            '39d342a4161095d2f28fb1253e4585978ac50521117da666e2b1f6f28b62f514'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  # https://bugs.llvm.org/show_bug.cgi?id=49228
  mv libunwind{-$pkgver.src,}

  mv cmake{-$pkgver.src,}
  cd lld-$pkgver.src
  mkdir build
}

build() {
  cd lld-$pkgver.src/build

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm16
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_SHARED_LIBS=ON
    -DLLVM_CMAKE_DIR=/usr/lib/llvm16/lib/cmake
    -DLLVM_CONFIG=/usr/lib/llvm16/bin/llvm-config
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_INCLUDE_TESTS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  )
  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd lld-$pkgver.src/build
  ninja check-lld
}

package() {
  cd lld-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _libname _lib
  for _libname in COFF Common ELF MachO MinGW Wasm; do
    _lib=liblld$_libname.so.16
    mv "$pkgdir"/usr/lib/{llvm16/lib/,}$_lib
    ln -s ../../$_lib "$pkgdir/usr/lib/llvm16/lib/$_lib"
  done
}

# vim:set ts=2 sw=2 et:
