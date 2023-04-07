# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Adam Hani Schakaki <krzd@krzd.net>

pkgname=caribou
pkgver=0.4.21+75+g8ad9883
pkgrel=4
pkgdesc="A text entry and UI navigation application (on-screen keyboard)"
url="https://wiki.gnome.org/Projects/Caribou"
arch=(x86_64)
license=(LGPL)
depends=(at-spi2-atk python-atspi python-gobject gtk3 libxklavier libgee clutter dconf)
makedepends=(intltool docbook-xsl gtk2 gobject-introspection vala git gnome-common)
options=(!emptydirs)
_commit=8ad9883ace9b38905af9ff1dd1a8c19cdc560141  # master
source=("git+https://gitlab.gnome.org/GNOME/caribou.git#commit=$_commit"
        3.patch
        unicode_to_keyval-symbol-check.patch)
sha256sums=('SKIP'
            'c88b04a927e5a407503c007a78dafa7dcb71cf2002bbb3751d57cc21d090a2ed'
            '7b8969c275df30613531728408d75af1af22199b4fe3835d5ef67355f747799e')

pkgver() {
  cd $pkgname
  git describe --long | sed -e 's/-/+/g' -e 's/^CARIBOU_//' -e 's/_/./g'
}

prepare() {
  cd $pkgname

  # https://bugs.archlinux.org/task/69338
  # https://gitlab.gnome.org/GNOME/caribou/-/merge_requests/3
  git apply -3 ../3.patch

  # https://gitlab.gnome.org/GNOME/caribou/-/issues/7
  git apply -3 ../unicode_to_keyval-symbol-check.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
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
