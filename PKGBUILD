# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libevdev
pkgname="lib32-$_basename"
pkgver=1.14.0
pkgrel=1
pkgdesc="Wrapper library for evdev devices (32-bit)"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/libevdev/"
license=(MIT)
depends=('lib32-glibc' "$_basename" 'lib32-check')
makedepends=('python' 'gcc-multilib' 'valgrind' 'doxygen' 'meson' 'lib32-gcc-libs')
source=(https://www.freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz)
sha512sums=('527a643ec805618f04967c88105347966fc54726edbd884631255eb8f71cd4fdcb661b2051cd724a979372dbc5a7e47c8ab68098fa8cd3fcdd9a5413db7e062c')

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
  install -Dm644 "$srcdir/libevdev-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
