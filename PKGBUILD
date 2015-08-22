# $Id$
# Maintainer: Andrew Nelless <andrew@nelless.net>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: MThinkCpp <mtc.maintainer[at]outlook.com>
pkgname=libc++-msan
pkgver=3.6.2
pkgrel=1
pkgdesc='Standard C++ library implementation from the LLVM project (Memory Sanitizer enabled)'
url='http://libcxx.llvm.org'
license=('custom:University of Illinois/NCSA Open Source License')
arch=('i686' 'x86_64')
# gcc-libs needed for libgcc_s, because Arch doesn't use a pure compiler-rt clang
depends=('glibc' 'libc++abi' 'gcc-libs')
makedepends=('clang' 'cmake')
provides=('libc++')
conflicts=('libc++')
source=("http://www.llvm.org/releases/$pkgver/libcxx-${pkgver}.src.tar.xz")
md5sums=('22214c90697636ef960a49aef7c1823a')
options=('debug' '!strip')
install=${pkgname}.install

build() {
  mkdir -p libcxx-${pkgver}.src/build
  cd libcxx-${pkgver}.src/build
  CXXFLAGS="-Qunused-arguments" CFLAGS="-Qunused-arguments" \
    cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libcxxabi \
    -DLIBCXX_LIBCXXABI_INCLUDE_PATHS=/usr/include/cxxabi \
    -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_USE_SANITIZER=MemoryWithOrigins \
    -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/libcxx-${pkgver}.src"
  make
}
package() {
  install -Dm644 libcxx-${pkgver}.src/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  cd libcxx-${pkgver}.src/build
  make DESTDIR="$pkgdir" install
}
