# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.15.92
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('cogl' 'mesa' 'json-glib' 'atk' 'libxi' 'libxkbcommon')
makedepends=('gobject-introspection')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('e164b048c2da5d87023f722f689edea14d10a8051c8cde305c15c2d436d5297d')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-introspection \
    --enable-wayland-backend --enable-egl-backend --enable-evdev-input

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
