# Maintainer: bash0000000 <hidden>

pkgbase=pstl
pkgname=pstl
pkgver=19.1.7
pkgrel=1
pkgdesc="LLVM Parallel STL"
url="https://libcxx.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('clang' 'cmake' 'ninja' 'python')
checkdepends=('llvm')
options=('!lto' 'staticlibs')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
sha512sums=('c7d63286d662707a9cd54758c9e3aaf52794a91900c484c4a6efa62d90bc719d5e7a345e4192feeb0c9fd11c82570d64677c781e5be1d645556b6aa018e47ec8')

prepare() {
  sed -i 's/CREDITS.TXT/CREDITS/' llvm-project-$pkgver.src/pstl/LICENSE.TXT
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
    -DLLVM_ENABLE_RUNTIMES="pstl" \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_ENABLE_PIC=ON \
    -DLIBCXX_INSTALL_MODULES=ON \
    ../llvm-project-$pkgver.src/runtimes
}

package() {
  DESTDIR="$pkgdir" ninja -C build install-pstl
  install -Dm0644 llvm-project-$pkgver.src/pstl/CREDITS.txt "$pkgdir"/usr/share/licenses/pstl/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/pstl/LICENSE.TXT "$pkgdir"/usr/share/licenses/pstl/LICENSE
}
