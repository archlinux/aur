# Maintainer: William Huang <wp /at/ nerde /period/ pw>
# Contributor: Anatol Pomozov
# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmicay [at] gmail [dot] com>
# Contributor: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>

pkgbase=libc++-msan
pkgname=(libc++-msan libc++abi-msan)
pkgver=20.1.6
pkgrel=1
pkgdesc='LLVM C++ standard library - with support for memory sanitizers.'
url="https://libcxx.llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('clang' 'cmake' 'ninja' 'python')
checkdepends=('llvm')
options=('!lto' 'staticlibs')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"{,.sig})
sha512sums=('aae652fdc61bda3f80b1340a3270b687355bfb6817f4bc05dac2268a2f8c5fc677eadb515cda7c8518005f1dc39e7ce5d1c34bbc5a25f106ef8e6c8f1ecfdf6d'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'D574BD5D1D0E98895E3BF90044F2485E45D59042') # Tobias Hieta <tobias@hieta.se>

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
    -DLLVM_ENABLE_PIC=ON \
    -DLIBCXX_INSTALL_MODULES=ON \
    -DLIBCXXABI_USE_LLVM_UNWINDER=OFF \
    -DLLVM_USE_SANITIZER=MemoryWithOrigins \
    ../llvm-project-$pkgver.src/runtimes
  ninja cxx cxxabi
}

check() {
  # the tests are extremely slow
  # ninja -C build check-cxx check-cxxabi
  true
}

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
