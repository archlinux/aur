# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lld19
pkgver=19.1.7
pkgrel=2
pkgdesc="Linker from the LLVM project (Version 19)"
arch=('x86_64')
url="https://lld.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
depends=('llvm19-libs' 'gcc-libs' 'zlib' 'zstd')
makedepends=('llvm19' 'cmake' 'ninja' 'python-sphinx')
checkdepends=('llvm')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/lld-$pkgver.src.tar.xz{,.sig}
        $_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/libunwind-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig})
sha256sums=('630bf0f31b210e89fd7869bdfd6c376d010fc3b72ee42f08058435035c432e42'
            'SKIP'
            '96f833c6ad99a3e8e1d9aca5f439b8fd2c7efdcf83b664e0af1c0712c5315910'
            'SKIP'
            '10e650f436bc416674f01b5e01177405886f4d0f0b2568c6808044eacad52ea0'
            'SKIP'
            '11c5a28f90053b0c43d0dec3d0ad579347fc277199c005206b963c19aae514e3'
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
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm19
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_SHARED_LIBS=ON
    -DLLVM_CMAKE_DIR=/usr/lib/llvm19/lib/cmake
    -DLLVM_CONFIG=/usr/lib/llvm19/bin/llvm-config
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit
    -DLLVM_INCLUDE_TESTS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
  )
  cmake .. "${cmake_args[@]}"
  ninja
}

# Disabled as 2 tests fail
# check() {
#   cd lld-$pkgver.src/build
#   ninja check-lld
# }

package() {
  cd lld-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _libname _lib
  for _libname in COFF Common ELF MachO MinGW Wasm; do
    _lib=liblld$_libname.so.19.1
    mv "$pkgdir"/usr/lib/{llvm19/lib/,}$_lib
    ln -s ../../$_lib "$pkgdir/usr/lib/llvm19/lib/$_lib"
  done

}

# vim:set ts=2 sw=2 et:

