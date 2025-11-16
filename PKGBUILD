# Previous Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('llvm16' )
pkgver=16.0.6
pkgrel=3
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses'
             'libxml2' 'python' 'clang')
checkdepends=('python-psutil')
options=('staticlibs' '!lto') # https://github.com/llvm/llvm-project/issues/57740
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/llvm-$pkgver.src.tar.xz{,.sig}
        $_source_base/cmake-$pkgver.src.tar.xz{,.sig}
        $_source_base/third-party-$pkgver.src.tar.xz{,.sig})
sha256sums=('e91db44d1b3bb1c33fcea9a7d1f2423b883eaa9163d3d56ca2aa6d2f0711bc29'
            'SKIP'
            '39d342a4161095d2f28fb1253e4585978ac50521117da666e2b1f6f28b62f514'
            'SKIP'
            '15f5b9aeeba938530af977d5f9205612737a091a7f0f6c8075df8723b7713f70'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  rename -v -- "-$pkgver.src" '' {cmake,third-party}-$pkgver.src
  cd llvm-$pkgver.src
  mkdir build
}

build() {
  cd llvm-$pkgver.src/build

  # Build only minimal debug info to reduce size
  CFLAGS=${CFLAGS/-g /-g1 }
  CXXFLAGS=${CXXFLAGS/-g /-g1 }

  local cmake_args=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm16
    -DCMAKE_SKIP_RPATH=ON
    -DLLVM_BINUTILS_INCDIR=/usr/include
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_BUILD_TESTS=ON
    -DLLVM_ENABLE_BINDINGS=OFF
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_ENABLE_RTTI=ON
    -DLLVM_HOST_TRIPLE=$CHOST
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_USE_PERF=ON
    -DCMAKE_CXX_STANDARD=17
    -DCMAKE_C_COMPILER=clang 
    -DCMAKE_CXX_COMPILER=clang++ 
    -DCMAKE_C_FLAGS="-include stdint.h" 
    -DCMAKE_CXX_FLAGS="-include stdint.h" 
  )

  cmake .. "${cmake_args[@]}"
  ninja
}

check() {
  cd llvm-$pkgver.src/build
  LD_LIBRARY_PATH=$PWD/lib ninja check
}
package() {
  pkgdesc="Compiler infrastructure and runtime libraries (LLVM 16)"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2' 'perl')

  cd llvm-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install

  # Move runtime libraries into main package and create symlinks
  # install -d "$pkgdir/usr/lib/llvm16/lib"
  # mv -f "$pkgdir"/usr/lib/llvm16/lib/libLLVM-{16,$pkgver}.so "$srcdir/"
  # mv -f "$pkgdir"/usr/lib/llvm16/lib/LLVMgold.so "$srcdir/"
  #
  # cp -P "$srcdir"/libLLVM-{16,$pkgver}.so "$pkgdir/usr/lib/"
  # ln -s ../../libLLVM-16.so "$pkgdir/usr/lib/llvm16/lib/libLLVM-16.so"
  # ln -s ../../libLLVM-16.so "$pkgdir/usr/lib/llvm16/lib/libLLVM-$pkgver.so"
  # cp -P "$srcdir"/LLVMgold.so "$pkgdir/usr/lib/llvm16/lib/"

  # Versioned /usr/bin symlinks
  # install -d "$pkgdir/usr/bin"
  # local _binary
  # for _binary in "$pkgdir"/usr/lib/llvm16/bin/*; do
  #   local _basename=${_binary##*/}
  #   ln -s ../lib/llvm16/bin/$_basename "$pkgdir/usr/bin/$_basename-16"
  # done
  #
  # install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
