# Maintainer: An Nguyen <an-1258@outlook.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Lancelot Owczarczak <lancelot@owczarczak.fr>

pkgname=lldb17
pkgver=17.0.6
pkgrel=1
pkgdesc="Next generation, high-performance debugger for LLVM 17"
arch=('x86_64')
url="https://lldb.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm17-libs' 'clang17' 'gcc-libs' 'zlib' 'xz' 'libedit' 'ncurses'
         'libxml2' 'python')
makedepends=('llvm17' 'cmake' 'ninja' 'swig' 'python-sphinx')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/lldb-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('7bb3159e10e04cee355e51a2683097d130687d310b26af4e1cb80bd0b9f74cd3'
            'SKIP'
            '807f069c54dc20cb47b21c1f6acafdd9c649f3ae015609040d6182cab01140f4'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

prepare() {
  mv cmake{-$pkgver.src,}
  cd lldb-$pkgver.src
  mkdir build
}

build() {
  cd lldb-$pkgver.src/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm17
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm17
    -DCMAKE_SKIP_RPATH=ON
    -DCLANG_LINK_CLANG_DYLIB=ON
    -DLLVM_ENABLE_SPHINX=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DSPHINX_WARNINGS_AS_ERRORS=OFF
  )
  cmake .. "${cmake_args[@]}"
  ninja all docs-lldb-man
}

package() {
  cd lldb-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 docs/man/lldb.1 "$pkgdir/usr/lib/llvm17/share/man/man1/lldb.1"

  ln -sv "$pkgdir/usr/lib/llvm17/lib/liblldb.so.$pkgver" "$pkgdir/usr/lib/liblldb.so.17"

  # Compile Python scripts
  python3 -m compileall "$pkgdir"
  python3 -O -m compileall "$pkgdir"
  python3 -OO -m compileall "$pkgdir"
}

# vim:set ts=2 sw=2 et:
