# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=1.4.4
pkgrel=3
pkgdesc="GTK clutter widget"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('clutter' 'gtk3')
makedepends=('gobject-introspection')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz
        dont-use-clutter_x11_set_use_argb_visual-on-non-X11.patch)
sha256sums=('bc3108594a01a08bb6d9b538afe995e4fd78634a8356064ee8137d87aad51b2e'
            '45e86e364756d6ac86c646ee1bcab6c9b94316673963e0b83b1140d9c4978bef')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../dont-use-clutter_x11_set_use_argb_visual-on-non-X11.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
