# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

pkgname=llvm-bolt
pkgver=18.1.8
pkgrel=1
pkgdesc='a post-link optimizer developed to speed up large applications'
url="https://github.com/llvm/llvm-project/tree/main/bolt"
license=('Apache-2.0 WITH LLVM-exception')
arch=('x86_64')
depends=(
  gcc-libs
  ncurses
  zlib
  zstd
)
makedepends=(
  cmake
  llvm
  llvm-libs
  ninja
  python
)
options=(!lto)
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"{,.sig})
sha512sums=('25eeee9984c8b4d0fbc240df90f33cbb000d3b0414baff5c8982beafcc5e59e7ef18f6f85d95b3a5f60cb3d4cd4f877c80487b5768bc21bc833f107698ad93db'
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
    -DLLVM_INSTALL_UTILS=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DLLVM_LINK_LLVM_DYLIB=OFF \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_ENABLE_PROJECTS="bolt" \
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64" \
    ../llvm-project-$pkgver.src/llvm
  ninja bolt
}

package () {
  DESTDIR="$pkgdir" ninja -C build install-bolt
}
