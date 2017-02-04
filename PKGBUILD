# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmicay [at] gmail [dot] com>
# Contributor: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>

pkgname=libc++
pkgver=3.9.1
pkgrel=1
pkgdesc='A new implementation of the C++ standard library, targeting C++11.'
url='http://libcxx.llvm.org'
license=('custom:University of Illinois/NCSA Open Source License')
arch=('i686' 'x86_64')
# gcc-libs needed for libgcc_s, because Arch doesn't use a pure compiler-rt clang
depends=('glibc' 'libc++abi' 'gcc-libs')
makedepends=('clang' 'subversion' 'cmake')
source=("http://www.llvm.org/releases/$pkgver/libcxx-${pkgver}.src.tar.xz"{,.sig})
sha512sums=('a5976e4096624a7307b3e43f4a22ac2dc74572226e0f57af9f3ef537a14c3cff1601b7042aef9dc40a0ee53ca76b08d72eb9c253dcf34f115d3153c302db7070'
            'SKIP')
validpgpkeys=(
              # Bill Wendling <void@llvm.org>
              54E3BDE33185D9F69664D22455F5CD70BB5A0569
              # Tom Stellard <tom@stellard.net>
              11E521D646982372EB577A1F8F0871F202119294
              # Hans Wennborg <hans@chromium.org>
              B6C8F98282B944E3B0D5C2530FC3042E345AD05D
)

build() {
  mkdir -p libcxx-${pkgver}.src/build
  cd libcxx-${pkgver}.src/build
  CC=clang CXX=clang++ cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libcxxabi \
    -DLIBCXX_CXX_ABI_INCLUDE_PATHS=/usr/include/cxxabi \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/libcxx-${pkgver}.src"
  make
}

package() {
  cd libcxx-${pkgver}.src/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ${srcdir}/libcxx-${pkgver}.src/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
