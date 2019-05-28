# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=gupnp-1.0
pkgver=1.0.3
pkgrel=1
pkgdesc="An object-oriented UPNP framework"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/GUPnP"
license=(LGPL)
depends=(gssdp-1.0 util-linux)
makedepends=(gobject-introspection gtk-doc vala autoconf-archive git)
optdepends=('python: gupnp-binding-tool')
_commit=0e4f31cfc489a2c21f052885695902ae5ba98c8a  # tags/gupnp-1.0.3^0
source=("git+https://gitlab.gnome.org/GNOME/gupnp.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd gupnp
  git describe --tags | sed 's/^gupnp-//;s/-/+/g'
}

prepare() {
  cd gupnp
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd gupnp
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug \
    --disable-static \
    --enable-compile-warnings=minimum \
    --enable-gtk-doc \
    --with-context-manager=linux
  make
}

check() {
  cd gupnp
  make check
}

package() {
  cd gupnp
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/gtk-doc/html/gupnp "$pkgdir"/usr/share/gtk-doc/html/gupnp-1.0
}
