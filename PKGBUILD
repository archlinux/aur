# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=lib32-sdl2-compat
pkgver=2.32.70
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
sha512sums=('477eff4b24dde48b8565406c636ffd5e9422700b28aec4bbb6165cbc30e8d95d0fe2c2400f8479c859ab82e8700370e2b5d6041721433ddb0064a1ec262a4af8'
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
