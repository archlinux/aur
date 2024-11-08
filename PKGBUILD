# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: DexterHaxxor <fox@dexterhaxxor.dev>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=lib32-sdl2-compat-git
pkgver=r701.44a2d4d
pkgrel=1
pkgdesc="SDL2 runtime compatibility library using SDL3"
url="https://github.com/libsdl-org/sdl2-compat"
depends=('lib32-sdl3' 'lib32-glibc')
makedepends=('cmake' 'lib32-libgl' 'ninja' 'git')
arch=('x86_64' 'i686')
conflicts=('lib32-sdl2')
provides=('lib32-sdl2')
license=('MIT')
source=("git+https://github.com/libsdl-org/sdl2-compat.git")
sha512sums=('SKIP')

pkgver() {
  cd sdl2-compat
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cmake -B build \
  -S sdl2-compat \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib32 \
  -DSDL2COMPAT_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}/usr/share"
  install -Dm644 "${srcdir}/sdl2-compat/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/include"
}

