# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

pkgname=llvm-bolt
pkgver=22.1.1
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
  clang
  cmake
  llvm
  llvm-libs
  ninja
  python
)
options=(!lto)
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"{,.sig})
sha512sums=('dddf09651c0e77caa83284788765016b023a9e239cfe35820bab7be64b68218e86bcf39bb07ee14dcddf7b0974b551344d2bff0e109cc9458b0394a3c940917c'
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
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
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
