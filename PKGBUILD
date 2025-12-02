# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libevdev
pkgname="lib32-$_basename"
pkgver=1.13.6
pkgrel=1
pkgdesc="Wrapper library for evdev devices (32-bit)"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/libevdev/"
license=(MIT)
depends=('lib32-glibc' "$_basename" 'lib32-check')
makedepends=('python' 'gcc-multilib' 'valgrind' 'doxygen' 'meson' 'lib32-gcc-libs')
source=(https://www.freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz)
sha512sums=('367081bf587dd63845086714e0b51ec0f9eb107d4c32cc387cf60d3c41ad3cb31a64b1c74e25116b5bc900d6c34e82694697e942bb646f7161b0670b70d1b54d')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  arch-meson $_basename-$pkgver build \
    --libdir=/usr/lib32 \
    -D documentation=disabled
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -rf "$pkgdir"/usr/{bin,share,include}
}
