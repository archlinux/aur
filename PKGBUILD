# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=java-gnome
pkgver=4.1.3
pkgrel=1
pkgdesc="Java bindings to the GNOME platform (including gtk, glib and glade)"
arch=('i686' 'x86_64')
url="http://java-gnome.sourceforge.net"
license=('GPL')
depends=('java-runtime' 'gtksourceview3' 'librsvg' 'libunique3' 'libnotify' 'enchant')
makedepends=('java-environment' 'junit' 'python2')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/4.1/$pkgname-$pkgver.tar.xz)
sha256sums=('060b2b249bad918b91a55a82b8a2ed085bec5734defaf31e6c8c5ad006532373')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Python2 fix
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' build/faster src/util/demux/demux.py

  # Adapt to the new build-system
  unset CLASSPATH
  if [ -d "$J2SDKDIR" ]; then
    ./configure jdk=$J2SDKDIR prefix=/usr
  else
    ./configure prefix=/usr
  fi
  make
  DISPLAY= make doc
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 DESTDIR=$pkgdir install

  install -d "$pkgdir/usr/share/gtk-doc/html/$pkgname"
  cp -R "$srcdir"/$pkgname-$pkgver/doc/api/* "$pkgdir/usr/share/gtk-doc/html/$pkgname"

  # Fix permissions
  chmod 644 "$pkgdir/usr/share/java/gtk-4.1.jar"
}
