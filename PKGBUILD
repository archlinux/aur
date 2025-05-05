# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=lib32-sdl2-compat
pkgver=2.32.56
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
sha512sums=('6117480fb29df01779b38e54596994a0e21f7c2247791ac3e2c8e416ea4c1048a3c00c04d74610b208076f9a79a5afee47cd4a072bdd69ddcecdf506fb6517b2'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga

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
