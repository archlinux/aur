# Maintainer: SanskritFritz (gmail)
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: serendipoldius (AUR)

pkgname=avant-window-navigator
pkgver=0.4.2
pkgrel=4
pkgdesc='AWN is a customisable dock-like bar at the edge of the screen.'
arch=('x86_64' 'i686')
url='https://launchpad.net/awn'
license=('GPL')
depends=('libdesktop-agnostic' 'libwnck' 'libgtop' 'gconf' 'python2-dbus' 'pygtk' 'python2-xdg' 'hicolor-icon-theme' 'xdg-utils' 'gtkmm')
makedepends=('gtk-doc' 'vala' 'intltool')
options=('!libtool')
install=$pkgname.install
source=("http://launchpad.net/awn/0.4/$pkgver/+download/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Python2 fix
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' awn-settings/{awnSettings.py.in,awnSettingsHelper.py}
  sed -i 's/with("python"/with("python2"/' applet-activation/main.cc

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc \
              --disable-static \
              PYTHON=/usr/bin/python2
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/awn.schemas" "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -r "$pkgdir/etc"
}

md5sums=('df3bd413de19bdda461df7ed4f9e2409')
