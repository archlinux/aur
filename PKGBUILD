# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=dockmanager
pkgver=0.1.0
pkgrel=6
pkgdesc="Dock-independent helper scripts for compatible docks"
url="https://launchpad.net/dockmanager"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libdesktop-agnostic' 'gconf' 'python2-dbus' 'python2-gobject2' 'python2-xdg')
makedepends=('intltool' 'vala')
optdepends=('pygtk: Banshee control, Rhythmbox control Helper'
            'deluge: Deluge badge Helper'
            'python2-mpd: Mpd control Helper'
            'python2-gconf: Open terminal here Helper'
            'gnome-python-desktop: Zeitgeist journal Helper'
            'zeitgeist: Zeitgeist journal, Zeitgeist menus Helper')
source=(http://launchpad.net/dockmanager/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' scripts/*.py

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/$pkgname \
              --disable-static --disable-debug --enable-release \
              PYTHON=python2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/dockmanager.schemas" "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -r "$pkgdir/etc"
}

sha256sums=('7afbf43f9e1a14b0b7d8f34ae8c017d5ab58bacdf26481082a489c10953e74f3')
