# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: orumin <dev@orum.in>

_basename=libinput
pkgname="lib32-$_basename"
pkgver=1.11.3
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
depends=('lib32-mtdev' 'lib32-systemd' 'lib32-libevdev' 'lib32-libwacom' "$_basename")
makedepends=('doxygen' 'graphviz' 'lib32-gtk3' 'meson')
source=(https://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz{,.sig})
sha512sums=('5e18daab6202bcbfddeebc35dac4cabb5f726b5b73f5fc87975b58f3019a54a4b1f506a3200e920638ddddfb978a0b96c23c2e90b081942f86d33c16d4836949'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd $_basename-$pkgver
  # Reduce docs size
  printf '%s\n' >>doc/libinput.doxygen.in \
    HAVE_DOT=yes DOT_IMAGE_FORMAT=svg INTERACTIVE_SVG=yes
}


build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson $_basename-$pkgver build --libdir=/usr/lib32 -Dtests=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  rm -rf ${pkgdir}/usr/{bin,lib,share,include}
}
