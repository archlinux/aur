# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmica [at] gmail [dot] com>
# Contributor: Benno Fünfstück <pyhaxor [at] googlemail [dot] com>

pkgname=libc++abi
pkgver=3.9.1
pkgrel=1
pkgdesc='A new implementation of low level support for a standard C++ library'
arch=('i686' 'x86_64')
url="http://libcxxabi.llvm.org/"
license=('MIT' 'custom:University of Illinois/NCSA Open Source License')
depends=('gcc-libs')
makedepends=('clang' 'cmake' 'libc++' 'libunwind' 'llvm')
source=("http://www.llvm.org/releases/$pkgver/libcxxabi-${pkgver}.src.tar.xz"{,.sig})
sha512sums=('4f5603f1476b759c86d4784728fbdd212c59b30dc56d787c1834bf68a9cd83071fa22658d24e5a58beb94c0c656b0e4457d7da6e3048715dd36bd68380fc336e'
            'SKIP')
validpgpkeys=(
              # Bill Wendling <void@llvm.org>
              54E3BDE33185D9F69664D22455F5CD70BB5A0569
              # Tom Stellard <tom@stellard.net>
              11E521D646982372EB577A1F8F0871F202119294
              # Hans Wennborg <hans@chromium.org>
              B6C8F98282B944E3B0D5C2530FC3042E345AD05D
)

prepare() {
  cd libcxxabi-${pkgver}.src
  sed -i 's/"${LLVM_BINARY_DIR}\/share\/llvm\/cmake"/"\/usr\/lib\/cmake\/llvm"/g' CMakeLists.txt
}

build() {
  mkdir -p libcxxabi-${pkgver}.src/build
  cd libcxxabi-${pkgver}.src/build
  CC=clang CXX=clang++ cmake -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${srcdir}/libcxxabi-${pkgver}.src"
  make
}

package() {
  cd libcxxabi-${pkgver}.src/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ${srcdir}/libcxxabi-${pkgver}.src/include/__cxxabi_config.h "${pkgdir}/usr/include/cxxabi/__cxxabi_config.h"
  install -Dm644 ${srcdir}/libcxxabi-${pkgver}.src/include/cxxabi.h "${pkgdir}/usr/include/cxxabi/cxxabi.h"
  install -Dm644 ${srcdir}/libcxxabi-${pkgver}.src/LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
