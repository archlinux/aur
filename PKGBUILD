# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libevdev
pkgname="lib32-$_basename"
pkgver=1.13.3
pkgrel=1
pkgdesc="Wrapper library for evdev devices (32-bit)"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/libevdev/"
license=(MIT)
depends=('lib32-glibc' "$_basename" 'lib32-check')
makedepends=('python' 'gcc-multilib' 'valgrind' 'doxygen' 'meson' 'lib32-gcc-libs')
source=(https://www.freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz)
sha512sums=('24330c7f6f003c95da97dcb66fcc750437db59ac9049415c35cbcaa1612845363a59180da6b3120c81d7d3f969adb139fa023ed765223e185fb68465d45a0fd2')

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
