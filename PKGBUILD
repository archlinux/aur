# Maintainer: William Huang <wp /at/ nerde /period/ pw>
# Contributor: Anatol Pomozov
# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmicay [at] gmail [dot] com>
# Contributor: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>

pkgbase=libc++-msan
pkgname=(libc++-msan libc++abi-msan libc++experimental-msan)
pkgver=14.0.6
pkgrel=1
url="https://libcxx.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('clang' 'cmake' 'ninja' 'python')
checkdepends=('llvm')
options=(!lto)
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"{,.sig})
sha512sums=('6fc6eeb60fac698702d1aac495fc0161eb7216a1f8db2020af8fccec5837831f7cc20dc2a169bf4f0b5f520748280b4a86621f3697d622aa58faaa45dbfaad13'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>
 
prepare() {
  mkdir -p build
  sed -i 's/CREDITS.TXT/CREDITS/' llvm-project-$pkgver.src/libcxx{,abi}/LICENSE.TXT
}
 
build() {
  cd build

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLIBCXX_INSTALL_EXPERIMENTAL_LIBRARY=NO \
    -DLLVM_USE_SANITIZER=MemoryWithOrigins \
    ../llvm-project-$pkgver.src/runtimes
  ninja cxx cxxabi cxx_experimental
}

# Enabling MSAN seems to break the tests?
# check() {
#   ninja -C build check-cxx check-cxxabi
# }

# Do not remove the space before the () or commitpkg will
# accidentally to run this function on the system (!!!) 
package_libc++-msan () {
  pkgdesc='LLVM C++ standard library - with support for memory sanitizers.'
  depends=("libc++abi-msan=$pkgver-$pkgrel")
  provides=('libc++')
  conflicts=('libc++')
  options=('staticlibs')

  DESTDIR="$pkgdir" ninja -C build install-cxx

  install -Dm0644 llvm-project-$pkgver.src/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
 
package_libc++abi-msan() {
  pkgdesc='Low level support for the LLVM C++ standard library - with support for memory sanitizers.'
  options=('staticlibs')
  provides=('libc++abi')
  conflicts=('libc++abi')
  
  DESTDIR="$pkgdir" ninja -C build install-cxxabi
  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
 
package_libc++experimental-msan() {
  depends=("libc++-msan=$pkgver-$pkgrel")
  pkgdesc='LLVM C++ experimental library - with support for memory sanitizers.'
  provides=('libc++experimental')
  conflicts=('libc++experimental')
  
  install -Dm0644 -t "$pkgdir"/usr/lib/ build/lib/libc++experimental.a
  install -Dm0644 llvm-project-$pkgver.src/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
