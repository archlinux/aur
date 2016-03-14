# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=topmenu-gtk
pkgver=0.2.2
pkgrel=1
pkgdesc="Gtk+ module and Mate/Xfce panel applets for a global menubar"
arch=('i686' 'x86_64')
url="https://git.javispedro.com/cgit/topmenu-gtk.git/about/"
license=('LGPL')
depends=('gtk2')
makedepends=('mate-panel' 'lxpanel' 'xfce4-panel')
optdepends=('gtk3: Module for GTK+ 3'
            'mate-panel: Topmenu Applet for MATE panel'
            'lxpanel: Topmenu Applet for LXPanel'
            'xfce4-panel: Topmenu Applet for Xfce4 panel')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.xz::https://git.javispedro.com/cgit/$pkgname.git/snapshot/release_$pkgver.tar.xz"
        "topmenu.xinit")
md5sums=('a84ef6a2a169b8e58ddb819e31f8a57f'
         '9b16242683f36fd2e97c8fad2326782b')

prepare() {
  cd release_$pkgver
  autoreconf -fi
}

build() {
  # GTK+ 2 version
  [ -d gtk2 ] || cp -r release_$pkgver gtk2
  cd gtk2
  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname
  make

  cd "$srcdir"
  # GTK+ 3 version
  [ -d gtk3 ] || cp -r release_$pkgver gtk3
  cd gtk3
  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname --with-gtk=3
  make
}

package() {
  cd gtk2
  make DESTDIR="$pkgdir" install
  cd "$srcdir/gtk3"
  make DESTDIR="$pkgdir" install
  install -D "$srcdir/topmenu.xinit" \
    "$pkgdir/etc/X11/xinit/xinitrc.d/41-topmenu-gtk-module.sh"
}
