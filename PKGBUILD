# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=lib32-sdl2-compat
pkgver=2.32.72
pkgrel=1
pkgdesc="An SDL2 compatibility layer that uses SDL3 behind the scenes - 32-bit"
url="https://github.com/libsdl-org/sdl2-compat"
depends=('sdl3' 'lib32-glibc' 'lib32-sdl3' 'sdl2-compat')
makedepends=('cmake' 'ninja')
arch=('x86_64')
conflicts=('lib32-sdl2')
provides=("lib32-sdl2=${pkgver}")
replaces=('lib32-sdl2')
license=('Zlib')
source=("https://github.com/libsdl-org/sdl2-compat/releases/download/release-${pkgver}/sdl2-compat-${pkgver}.tar.gz"{,.sig})
sha512sums=('0d5d8b26bbb92e25a102e734daeed8b2345957eec95c01ccfcb1461030c8e12300e19488a1eec45d217c56b64cefe8722d84f3e5c5d013efea9128161174b785'
            'SKIP')
validpgpkeys=('0900104363B4C9D4223DE149D913FE7D4B61D39B') # Sam Lantinga

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  # CFLAGS+=" -ffat-lto-objects"

  cmake -S sdl2-compat-$pkgver \
    -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}"/usr/{bin,include,share}
  install -Dm644 "sdl2-compat-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
