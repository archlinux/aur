# Maintainer:

pkgname=lib32-sdl12-compat
pkgver=1.2.56
pkgrel=1
pkgdesc='SDL 1.2 runtime compatibility library using SDL 2.0'
arch=(x86_64)
url=https://www.libsdl.org
license=(MIT)
depends=(lib32-glu lib32-sdl2 sdl12-compat)
makedepends=(cmake)
conflicts=(lib32-sdl)
provides=(lib32-sdl=1.2.15)
replaces=('lib32-sdl<=1.2.15-8')
source=($pkgname-$pkgver.tar.gz::https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-$pkgver.tar.gz)
sha256sums=('f62f3e15f95aade366ee6c03f291e8825c4689390a6be681535259a877259c58')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  cmake -B build -S sdl12-compat-release-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  install -Dm644 "${srcdir}/sdl12-compat-release-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
