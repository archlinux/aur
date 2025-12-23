# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Adam Hani Schakaki <krzd@krzd.net>

pkgname=caribou
pkgver=0.4.22
pkgrel=1
pkgdesc="A text entry and UI navigation application (on-screen keyboard)"
url="https://wiki.gnome.org/Projects/Caribou"
arch=(x86_64)
license=(LGPL)
depends=(at-spi2-atk python-atspi python-gobject gtk3 libxklavier libgee clutter dconf)
makedepends=(intltool docbook-xsl gobject-introspection vala git gnome-common)
options=(!emptydirs)
source=("git+https://github.com/nardholio/caribou.git#tag=$pkgver")
sha256sums=('5b4b43b546884560805eb94d841717e62155d0aab1941567a079119344dd4355')

prepare() {
  cd $pkgname

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
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
  cd $pkgname
  make -k check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
