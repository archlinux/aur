# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libsecret
pkgname=lib32-$_pkgbasename
pkgver=0.18.5+14+g9980655
pkgrel=2
pkgdesc="Library for storing and retrieving passwords and other secrets"
arch=(x86_64)
license=(LGPL)
url="https://wiki.gnome.org/Projects/Libsecret"
depends=(lib32-glib2 lib32-libgcrypt $_pkgbasename=$pkgver)
checkdepends=(python-dbus dbus-glib python-gobject gjs)
makedepends=(intltool gobject-introspection vala git gtk-doc)
optdepends=('gnome-keyring: key storage service (or use any other service implementing org.freedesktop.secrets)')
_commit=998065599c66055dcffa1ef1ddebb947ccd68248  # master
source=("git+https://git.gnome.org/browse/libsecret#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbasename
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgbasename
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgbasename
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --disable-gtk-doc --libdir=/usr/lib32
  make
}

check() {
  cd $_pkgbasename
  dbus-run-session make -k check 
}

package() {
  cd $_pkgbasename
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
