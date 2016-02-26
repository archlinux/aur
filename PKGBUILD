# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=topmenu-gtk
pkgver=0.2.1
pkgrel=1
pkgdesc="Gtk+ module and Mate/Xfce panel applets for a global menubar"
arch=('i686' 'x86_64')
url="https://git.javispedro.com/cgit/topmenu-gtk.git/about/"
license=('LGPL')
depends=('gtk2')
makedepends=('mate-panel' 'xfce4-panel')
optdepends=('mate-panel: Topmenu Applet for MATE panel'
            'xfce4-panel: Topmenu Applet for Xfce4 panel')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.xz::https://git.javispedro.com/cgit/$pkgname.git/snapshot/release_$pkgver.tar.xz"
        "topmenu.xinit")
md5sums=('b2129778b0649b942fc1ca2e4d750cc9'
         '9b16242683f36fd2e97c8fad2326782b')

prepare() {
  cd release_$pkgver
  autoreconf -fi
}

build() {
  cd release_$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd release_$pkgver
  make DESTDIR="$pkgdir" install
  install -D "$srcdir/topmenu.xinit" \
    "$pkgdir/etc/X11/xinit/xinitrc.d/41-topmenu-gtk-module.sh"
}
