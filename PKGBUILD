# Maintainer:
# Contributor: Ionut Biru <ibiru@archlinux.org>

## links
# https://telepathy.freedesktop.org/components/telepathy-farstream/
# https://github.com/TelepathyIM/telepathy-farstream

_pkgname="telepathy-farstream"
pkgname="$_pkgname"
pkgver=0.6.2
pkgrel=8
pkgdesc="Telepathy GLib-based client library that uses Farstream to handle Call channels"
url="https://telepathy.freedesktop.org/components/telepathy-farstream/"
license=('LGPL-2.1-or-later')
arch=('x86_64')

depends=(
  farstream
  telepathy-glib
)
makedepends=(
  dbus-glib
  glib2-docs
  gobject-introspection
  gtk-doc
)

_dl_url="http://telepathy.freedesktop.org/releases/telepathy-farstream"
_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source+=("$_pkgsrc.$_pkgext"::"$_dl_url/$_pkgsrc.$_pkgext")
sha256sums+=('6fa099f22d13a2a49240445a13e918928aef097675d76e5cc9f98ab496087e0a')

prepare() {
  cd "$_pkgsrc"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$_pkgsrc"

  local _configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib/telepathy
    --disable-static
    --enable-gtk-doc
  )

  ./configure "${_configure_options[@]}"
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
