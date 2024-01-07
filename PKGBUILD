# Maintainer: Luiz Henrique Laurini <luizhenriquelaurini@gmail.com>
# Contributor: Anatol Pomozov
# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmicay [at] gmail [dot] com>
# Contributor: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>

pkgbase=libc++-modules
pkgname=(libc++-modules libc++abi-modules)
pkgver=17.0.6
pkgrel=1
url="https://libcxx.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
arch=('x86_64')
depends=('gcc-libs' 'libunwind')
makedepends=('clang' 'cmake' 'ninja' 'python')
#checkdepends=('llvm')
options=(!lto)
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"{,.sig})
sha512sums=('6d85bf749e0d77553cc215cbfa61cec4ac4f4f652847f56f946b6a892a99a5ea40b6ab8b39a9708a035001f007986941ccf17e4635260a8b0c1fa59e78d41e30'
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
    -DLIBCXX_ENABLE_STD_MODULES=ON \
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_ENABLE_PIC=ON \
    ../llvm-project-$pkgver.src/runtimes
  ninja

  # We are installing system-wide, so remove these lines
  sed -i \
    -e '/target_include_directories/d' \
    -e '/-nostdinc/d' \
    modules/c++/v1/CMakeLists.txt
}

check() {
  # the tests are extremely slow
  # ninja -C build check-cxx check-cxxabi
  true
}

package_libc++-modules() {
  pkgdesc='LLVM C++ standard library with C++23 module support.'
  depends=("libc++abi-modules=$pkgver-$pkgrel")
  provides=('libc++')
  conflicts=('libc++')
  options=('staticlibs')

  DESTDIR="$pkgdir" ninja -C build install-cxx
  cp -r build/modules/c++ "$pkgdir"/usr/lib/

  install -Dm0644 llvm-project-$pkgver.src/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
 
package_libc++abi-modules() {
  pkgdesc='Low level support for the LLVM C++ standard library with C++23 module support.'
  provides=('libc++abi')
  conflicts=('libc++abi')
  options=('staticlibs')
  
  DESTDIR="$pkgdir" ninja -C build install-cxxabi
  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
