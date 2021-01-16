# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Adam Hani Schakaki <krzd@krzd.net>

pkgname=caribou
pkgver=0.4.21+66+g14f5428
pkgrel=2
pkgdesc="A text entry and UI navigation application (on-screen keyboard)"
arch=('x86_64')
url="http://live.gnome.org/Caribou"
license=(LGPL)
depends=(at-spi2-atk python-atspi python-gobject gtk3 libxklavier libgee clutter dconf)
makedepends=(intltool docbook-xsl gtk2 gobject-introspection vala git gnome-common)
options=(!emptydirs)
_commit=14f54287535ea3b5914638843710a8cef7b68e68  # master
source=("git+https://gitlab.gnome.org/GNOME/caribou.git#commit=$_commit"
        unicode_to_keyval-symbol-check.patch)
sha256sums=('SKIP'
            '7b8969c275df30613531728408d75af1af22199b4fe3835d5ef67355f747799e')

pkgver() {
  cd $pkgname
  git describe --long | sed -e 's/-/+/g' -e 's/^CARIBOU_//' -e 's/_/./g'
}

prepare() {
  cd $pkgname

  # https://gitlab.gnome.org/GNOME/caribou/-/issues/7
  patch -Np1 -i ../unicode_to_keyval-symbol-check.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname

  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/$pkgname \
    --disable-static \
    --disable-schemas-compile

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
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
