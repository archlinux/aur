# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libevdev
pkgname="lib32-$_basename"
pkgver=1.12.0
pkgrel=1
pkgdesc="Wrapper library for evdev devices (32-bit)"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/libevdev/"
license=(custom:X11)
depends=('lib32-glibc' "$_basename")
makedepends=('python' 'gcc-multilib' 'lib32-check' 'valgrind' 'doxygen' 'meson' 'lib32-gcc-libs')
source=(https://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz)
sha512sums=('6c1c1362d5112cdf3816d1f735c27e625f5463ebf10a83d675cd9364c3fb291ebcb91c051da442f1a36ed28ba7dd99af74546707f61274f7d5715c544a0ed04c')

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
  meson test -C build --print-errorlogs || true
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -rf "$pkgdir"/usr/{bin,share,include}
}
