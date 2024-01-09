# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

pkgname=llvm-bolt
pkgver=17.0.6
pkgrel=1
pkgdesc='a post-link optimizer developed to speed up large applications'
url="https://github.com/llvm/llvm-project/tree/main/bolt"
license=('custom:Apache 2.0 with LLVM Exception')
arch=('x86_64')
makedepends=('clang' 'cmake' 'ninja' 'llvm' 'python')
options=(!lto)
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"{,.sig})
sha512sums=('6d85bf749e0d77553cc215cbfa61cec4ac4f4f652847f56f946b6a892a99a5ea40b6ab8b39a9708a035001f007986941ccf17e4635260a8b0c1fa59e78d41e30'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

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

check() {
	ninja check-bolt
}
package () {
  DESTDIR="$pkgdir" ninja -C build install-bolt
}
