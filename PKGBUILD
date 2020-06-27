# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=tomboy
pkgver=1.15.9
pkgrel=1
pkgdesc="Desktop note-taking application for Linux and Unix"
arch=('x86_64')
license=('GPL')
url="http://www.gnome.org/projects/tomboy/"
depends=('gtk2' 'gtkspell' 'gconf' 'gconf-sharp' 'dbus-sharp-glib' 'mono-addins' 'hicolor-icon-theme')
makedepends=('intltool' 'pkgconfig'  'gnome-doc-utils' git yelp-tools autoconf-archive)
options=('!emptydirs' '!makeflags')
_commit=c22bfefd5855634bdba7b40b3d97aaa0965c6997  # tags/1.15.9^0
source=("git+https://git.gnome.org/browse/tomboy#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

check() {
  cd $pkgname
  make check
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export MONO_SHARED_DIR="$srcdir/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$pkgname"
  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-update-mimedb
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas" --domain tomboy "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}
