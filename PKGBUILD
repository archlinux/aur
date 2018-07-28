# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: orumin <dev@orum.in>

_basename=libinput
pkgname="lib32-$_basename"
pkgver=1.11.2
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
depends=('lib32-mtdev' 'lib32-systemd' 'lib32-libevdev' 'lib32-libwacom' "$_basename")
makedepends=('doxygen' 'graphviz' 'lib32-gtk3' 'meson')
source=(https://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz{,.sig})
sha512sums=('cb6ada877fc3c09f634f3db39d5507e66d4b86c3d632bb8f7498c7b01fdf8372b2053a79b641293900b7fcc0aa4e920f7c830d9c7b2d9ff3cd61c58eb7c20b65'
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
  rm -rf ${pkgdir}/usr/{bin,share,include}
}
