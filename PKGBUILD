# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=telepathy-logger
pkgver=0.8.2
pkgrel=6
pkgdesc='Telepathy framework logging daemon'
arch=('x86_64')
url='https://telepathy.freedesktop.org/'
license=('LGPL-2.1-or-later')
depends=('dconf' 'dbus-glib' 'glib2' 'glibc' 'libxml2' 'sqlite' 'telepathy-glib')
makedepends=('gobject-introspection' 'intltool' 'libxslt' 'python')
source=("https://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.bz2"{,.asc}
        '0001-tools-Fix-the-build-with-Python-3.patch')
sha256sums=('8fcad534d653b1b365132c5b158adae947810ffbae9843f72dd1797966415dae'
            'SKIP'
            'd94899bed85a4ac90158838524d16c761956eec2cd0d223b6a18bffa09ec008b')
validpgpkeys=('5113B855236702158C41C366432705FACDD40325') # Debarshi Ray

prepare() {
  cd $pkgname-$pkgver
  # Fix build with python3
  patch -Np1 -i ../0001-tools-Fix-the-build-with-Python-3.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib/telepathy
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname-$pkgver
  make -j1 check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
