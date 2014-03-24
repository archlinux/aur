# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.18.0
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('cogl' 'mesa' 'json-glib' 'atk' 'libxi' 'libxkbcommon' 'libinput')
makedepends=('gobject-introspection')
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('937ac94d10d4562c67554dd3d087bf0859a3bf254922a226fc0c13a39a457869')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-introspection \
    --enable-wayland-backend --enable-egl-backend --enable-evdev-input \
    --enable-wayland-compositor

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
