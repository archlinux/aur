# $Id$
# Maintainer: Marcin Mikołajczak <me@m4sk.in>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
#              Mingtian Yang <skylee@skylee.xyz>

pkgname=topmenu-gtk
pkgver=0.3
pkgrel=1
pkgdesc="Gtk+ module and Mate/Xfce panel applets for a global menubar"
arch=('i686' 'x86_64')
url="https://git.javispedro.com/cgit/topmenu-gtk.git/about/"
license=('GPL')
makedepends=('lxpanel' 'mate-panel' 'xfce4-panel')
optdepends=('gtk2: Module for GTK+ 2'
            'gtk3: Module for GTK+ 3'
            'lxpanel: Topmenu Applet for LXPanel'
            'mate-panel: Topmenu Applet for MATE panel'
            'xfce4-panel: Topmenu Applet for Xfce4 panel')
source=("$pkgname-$pkgver.tar.xz::https://git.javispedro.com/cgit/topmenu-gtk.git/snapshot/topmenu-gtk-release_$pkgver.tar.gz"
        "topmenu.xinit")
md5sums=('4b9cb7ce0479a0daedce64e9c7640dfd'
         '9b16242683f36fd2e97c8fad2326782b')

prepare() {
  cd topmenu-gtk-release_$pkgver
  autoreconf -fi
}

build() {
  # GTK+ 2 version
  [ -d gtk2 ] || cp -r topmenu-gtk-release_$pkgver gtk2
  cd gtk2
  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname --disable-mate-applet

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make

  cd "$srcdir"
  # GTK+ 3 version
  [ -d gtk3 ] || cp -r topmenu-gtk-release_$pkgver gtk3
  cd gtk3
  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname --with-gtk=3 --enable-mate-applet

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$srcdir/gtk2"
  make DESTDIR="$pkgdir" install
  cd "$srcdir/gtk3"
  make DESTDIR="$pkgdir" install
  install -D "$srcdir/topmenu.xinit" \
    "$pkgdir/etc/X11/xinit/xinitrc.d/41-topmenu-gtk-module.sh"
}
