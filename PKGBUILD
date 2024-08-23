# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libevdev
pkgname="lib32-$_basename"
pkgver=1.13.2
pkgrel=1
pkgdesc="Wrapper library for evdev devices (32-bit)"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/libevdev/"
license=(MIT)
depends=('lib32-glibc' "$_basename" 'lib32-check')
makedepends=('python' 'gcc-multilib' 'valgrind' 'doxygen' 'meson' 'lib32-gcc-libs')
source=(https://www.freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz)
sha512sums=('558267df0e45d8641a58dddb9fe30e2235ce247d96710189b09512d19d691afbd25189d188bb26bb5092fbbe249fbc7ca60a9e6af4fab535a946d5a3e030a21f')

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
