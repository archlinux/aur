# Maintainer: bash0000000 <hidden>

# Based on https://gitlab.archlinux.org/archlinux/packaging/packages/libcplusplus/-/blob/main/PKGBUILD?ref_type=heads

pkgbase=libc++-with-libunwind
pkgname=libc++-with-libunwind
pkgver=19.1.7
pkgrel=1
pkgdesc="LLVM C++ standard library(Build with libunwind and libc++abi)"
url="https://libcxx.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('clang' 'cmake' 'ninja' 'python')
conflicts=('libc++' 'libc++abi' 'llvm-libunwind')
provides=('libc++' 'libc++abi' 'llvm-libunwind')
checkdepends=('llvm')
options=('!lto' 'staticlibs')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
sha512sums=('c7d63286d662707a9cd54758c9e3aaf52794a91900c484c4a6efa62d90bc719d5e7a345e4192feeb0c9fd11c82570d64677c781e5be1d645556b6aa018e47ec8')

prepare() {
  mkdir -p build
  sed -i 's/CREDITS.TXT/CREDITS/' llvm-project-$pkgver.src/libcxx/LICENSE.TXT
  sed -i 's/CREDITS.TXT/CREDITS/' llvm-project-$pkgver.src/libcxxabi/LICENSE.TXT
  sed -i 's/CREDITS.TXT/CREDITS/' llvm-project-$pkgver.src/libunwind/LICENSE.TXT
}

build() {
  cd build

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_ENABLE_PIC=ON \
    -DLIBCXX_INSTALL_MODULES=ON \
    -DLIBUNWIND_USE_COMPILER_RT=ON \
    -DLIBCXXABI_USE_COMPILER_RT=ON \
    -DLIBCXX_ENABLE_ASSERTIONS=ON \
    -DLIBCXX_USE_COMPILER_RT=ON \
    -DLIBUNWIND_INSTALL_INCLUDE_DIR="\usr\include\unwind" \
    ../llvm-project-$pkgver.src/runtimes
  ninja cxx cxxabi unwind
}

package() {
  DESTDIR="$pkgdir" ninja -C build install-cxx
  DESTDIR="$pkgdir" ninja -C build install-cxxabi
  DESTDIR="$pkgdir" ninja -C build install-unwind
  rm -f "$pkgdir/usr/lib/libunwind.so"
  install -Dm0644 llvm-project-$pkgver.src/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/libc++/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/libc++/LICENSE
  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/CREDITS.TXT "$pkgdir"/usr/share/licenses/libc++abi/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/LICENSE.TXT "$pkgdir"/usr/share/licenses/libc++abi/LICENSE
  install -Dm0644 llvm-project-$pkgver.src/libunwind/LICENSE.TXT "$pkgdir"/usr/share/licenses/libunwind1/LICENSE

}
