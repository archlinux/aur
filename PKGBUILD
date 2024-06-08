# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

pkgname=llvm-bolt
pkgver=18.1.7
pkgrel=1
pkgdesc='a post-link optimizer developed to speed up large applications'
url="https://github.com/llvm/llvm-project/tree/main/bolt"
license=('custom:Apache 2.0 with LLVM Exception')
arch=('x86_64')
makedepends=('clang' 'cmake' 'ninja' 'llvm' 'llvm-libs' 'python')
options=(!lto)
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"{,.sig})
sha512sums=('0f67818267803aca9d2bc9eb89335ee6dc56269e8066a0f8a48c4a959e8805dbf6bc839b9f96a92f86ee50d72e7cc326ffe18febb5eb06751ab54a217c0221c8'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_INSTALL_UTILS=ON \
    -DBUILD_SHARED_LIBS:BOOL=OFF \
    -DLLVM_LINK_LLVM_DYLIB:BOOL=OFF \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_ENABLE_PROJECTS="bolt" \
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64" \
    ../llvm-project-$pkgver.src/llvm
  ninja bolt
}

package () {
  DESTDIR="$pkgdir" ninja -C build install-bolt
}
