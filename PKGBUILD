# Maintainer: Dave Daynard <nardholio@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Adam Hani Schakaki <krzd@krzd.net>

pkgname=(caribou libcaribou)
pkgver=0.4.22
pkgrel=2
url="https://wiki.gnome.org/Projects/Caribou"
arch=(x86_64)
license=(LGPL)
makedepends=(intltool docbook-xsl gobject-introspection vala git gnome-common)
options=(!emptydirs !debug)
source=("git+https://github.com/nardholio/caribou.git#tag=$pkgver")
sha256sums=('5b4b43b546884560805eb94d841717e62155d0aab1941567a079119344dd4355')

prepare() {
  cd caribou

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd caribou
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --disable-gtk2-module \
    --disable-static \
    --disable-schemas-compile
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd caribou
  make -k check
}

package_caribou() {
  pkgdesc="A text entry and UI navigation application (on-screen keyboard)"
  depends=(at-spi2-atk python-atspi python-gobject gtk3 libxklavier libgee clutter dconf libcaribou)

  cd caribou
  make DESTDIR="$pkgdir" install

  mkdir -p "$srcdir/libcaribou-pkg/usr/include" \
    "$srcdir/libcaribou-pkg/usr/lib/pkgconfig" \
    "$srcdir/libcaribou-pkg/usr/lib/girepository-1.0" \
    "$srcdir/libcaribou-pkg/usr/share/gir-1.0" \
    "$srcdir/libcaribou-pkg/usr/share/vala/vapi"

  mv "$pkgdir/usr/include/libcaribou" "$srcdir/libcaribou-pkg/usr/include/"
  mv "$pkgdir/usr/lib/libcaribou".* "$srcdir/libcaribou-pkg/usr/lib/"
  mv "$pkgdir/usr/lib/pkgconfig/caribou-1.0.pc" "$srcdir/libcaribou-pkg/usr/lib/pkgconfig/"
  mv "$pkgdir/usr/share/gir-1.0/Caribou-1.0.gir" "$srcdir/libcaribou-pkg/usr/share/gir-1.0/"
  mv "$pkgdir/usr/lib/girepository-1.0/Caribou-1.0.typelib" "$srcdir/libcaribou-pkg/usr/lib/girepository-1.0/"
  mv "$pkgdir/usr/share/vala/vapi/caribou"* "$srcdir/libcaribou-pkg/usr/share/vala/vapi/"
}

package_libcaribou() {
  pkgdesc="Input assistance library for caribou"
  depends=(gtk3 libxklavier libgee clutter)
  provides=('libcaribou.so')

  mv "$srcdir/libcaribou-pkg/"* "$pkgdir/"
}

# vim:set ts=2 sw=2 et:
