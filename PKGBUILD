# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.26.0+35+g9c4330b6d
pkgrel=1
pkgdesc="A toolkit for creating fast, portable, compelling dynamic UIs"
url="https://blogs.gnome.org/clutter/"
arch=(i686 x86_64)
license=(LGPL)
depends=(gtk3 cogl libinput)
makedepends=(gobject-introspection gtk-doc git)
_commit=9c4330b6ddbae230de8b25610e59af143e38b2ab  # master
source=("git+https://git.gnome.org/browse/clutter#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr \
    --enable-introspection \
    --enable-egl-backend \
    --enable-gdk-backend \
    --enable-wayland-backend \
    --enable-x11-backend \
    --enable-evdev-input \
    --enable-wayland-compositor \
    --enable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
