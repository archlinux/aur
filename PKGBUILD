# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.26.0+24+g79da526
pkgrel=1
pkgdesc="A toolkit for creating fast, portable, compelling dynamic UIs"
arch=(i686 x86_64)
url="http://clutter-project.org/"
license=(LGPL)
depends=(gtk3 cogl libinput)
makedepends=(gobject-introspection gtk-doc git)
_commit=79da526145de3033e01eb1de6d6ec712639a7ea5
source=("git://git.gnome.org/clutter#commit=$_commit")
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
