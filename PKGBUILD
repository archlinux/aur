# Maintainer: William Huang <wp /at/ nerde /period/ pw>
# Contributor: Anatol Pomozov
# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmicay [at] gmail [dot] com>
# Contributor: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>

pkgbase=libc++-msan
pkgname=(libc++-msan libc++abi-msan libc++experimental-msan)
pkgver=13.0.1
pkgrel=1
url="https://libcxx.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('clang' 'cmake' 'llvm' 'libunwind' 'ninja' 'python')
options=(!lto)
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-$pkgver.src.tar.xz"{,.sig}
        "https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/libcxx-$pkgver.src.tar.xz"{,.sig}
        "https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/libcxxabi-$pkgver.src.tar.xz"{,.sig})
noextract=("${source[@]##*/}")
sha512sums=('05fbe8708ac3d0dfef3a9135ee88185a95ed492095429a97d33b8aadb0187e59ad42d1a7184f02b5c84fdd31f3d7227c65bd292ed0aa039b29522e59cf90a965'
            'SKIP'
            '72970fbb3db44a652e89ace7843e992b4f118c978fa0fa7035bf5825cb6958cf71f7c80b56c1970977177bb3bcbf81309d4f01c29b3ac1cd057be54baf55e56f'
            'SKIP'
            '1a7c032ee34643518be01edddc16b1c872f339ed2944d31573438d38a018abc801a53f3fbd97e6a3d6ee58a6ed55d9703a8531ac7290c1d6e3e5593b97186749'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A' # Tom Stellard <tstellar@redhat.com> (.1 releases)
              'B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org> (.0 releases)
 
prepare() {
  mkdir -p build llvm/projects/libcxx llvm/projects/libcxxabi
  bsdtar --strip-components 1 -zxf "${source[0]##*/}" -C llvm
  bsdtar --strip-components 1 -zxf "${source[2]##*/}" -C llvm/projects/libcxx
  bsdtar --strip-components 1 -zxf "${source[4]##*/}" -C llvm/projects/libcxxabi
  sed -i 's/CREDITS.TXT/CREDITS/' llvm/projects/libcxx/LICENSE.TXT llvm/projects/libcxxabi/LICENSE.TXT
}
 
build() {
  cd build

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLIBCXX_INSTALL_EXPERIMENTAL_LIBRARY=NO \
    -DLLVM_USE_SANITIZER=MemoryWithOrigins \
    "$srcdir"/llvm
  ninja cxx cxx_experimental
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

  install -Dm0644 "$srcdir"/llvm/projects/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 "$srcdir"/llvm/projects/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
 
package_libc++abi-msan() {
  pkgdesc='Low level support for the LLVM C++ standard library - with support for memory sanitizers.'
  options=('staticlibs')
  provides=('libc++abi')
  conflicts=('libc++abi')
  
  DESTDIR="$pkgdir" ninja -C build install-cxxabi
  install -Dm0644 "$srcdir"/llvm/projects/libcxxabi/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 "$srcdir"/llvm/projects/libcxxabi/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
 
package_libc++experimental-msan() {
  depends=("libc++-msan=$pkgver-$pkgrel")
  pkgdesc='LLVM C++ experimental library - with support for memory sanitizers.'
  provides=('libc++experimental')
  conflicts=('libc++experimental')
  
  install -Dm0644 -t "$pkgdir"/usr/lib/ build/lib/libc++experimental.a
  install -Dm0644 llvm/projects/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm/projects/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
