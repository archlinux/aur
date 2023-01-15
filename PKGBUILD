# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libcryptui
pkgver=3.12.2+r71+ged4f890e
pkgrel=1
epoch=1
pkgdesc="Library for OpenPGP prompts"
url="https://gitlab.gnome.org/GNOME/libcryptui"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gpgme dbus-glib libnotify gcr dconf libsm)
makedepends=(intltool gobject-introspection gnome-common git)
provides=(libcryptui.so)
_commit=ed4f890ee29b94c1bedd7030d5c857e3b9edb465  # master
source=("git+https://gitlab.gnome.org/GNOME/libcryptui.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
