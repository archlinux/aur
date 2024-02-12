#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=3.12.0+r14+g23438cc
pkgrel=1
epoch=1
pkgdesc="GNOME keyring client library (deprecated)"
url="https://gitlab.gnome.org/Archive/libgnome-keyring"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  dbus
  glib2
  libgcrypt
)
makedepends=(
  git
  gnome-common
  gobject-introspection
  intltool
  vala
)
optdepends=('org.freedesktop.secrets: secret storage backend')
_commit=23438cc767a744f29aeaf8cb8746f8d5ce9cdb32  # master
source=("git+https://gitlab.gnome.org/Archive/libgnome-keyring.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --libexecdir=/usr/lib
    --disable-static
    --enable-gtk-doc
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
