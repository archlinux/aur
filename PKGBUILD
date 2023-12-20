# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lld
pkgver=17.0.6
pkgrel=1
pkgdesc="Linker from LLVM 17"
arch=('x86_64')
url="https://lld.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm17-libs' 'gcc-libs' 'zlib' 'zstd')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx')
options=('!lto') # LTO causes a couple of test failures
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/lld-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/libunwind-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('4ac13125616dc44905b85820aa403d27ec1226329b7f674daeb5f5584c6f0b22'
            'SKIP'
            'b638167da139126ca11917b6880207cc6e8f9d1cbb1a48d87d017f697ef78188'
            'SKIP'
            '9e7535a353aa862730b4ba38df42e06f6856b40c4cc51b57f27b5046dc21d70d'
            'SKIP'
            '807f069c54dc20cb47b21c1f6acafdd9c649f3ae015609040d6182cab01140f4'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

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
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm17
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm17
    -DCMAKE_INSTALL_DOCDIR=share/doc
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_SHARED_LIBS=ON
    -DLLVM_BUILD_DOCS=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_INCLUDE_TESTS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
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

  # https://bugs.llvm.org/show_bug.cgi?id=42455
  install -Dm644 -t "$pkgdir/usr/lib/llvm17/share/man/man1" ../docs/ld.lld.1

  # Remove documentation sources
  rm -r "$pkgdir"/usr/lib/llvm17/share/doc/lld/html/{_sources,.buildinfo}
}

# vim:set ts=2 sw=2 et:
