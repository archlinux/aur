# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.26.2
pkgrel=2
pkgdesc="A toolkit for creating fast, portable, compelling dynamic UIs"
url="https://blogs.gnome.org/clutter/"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 cogl libinput)
makedepends=(gobject-introspection gtk-doc git)
_commit=2faa83baf3ce9b9c94635311ad79944ab2a73c84  # tags/1.26.2^0
source=("git+https://gitlab.gnome.org/GNOME/clutter.git#commit=$_commit")
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

# vim:set sw=2 et:
