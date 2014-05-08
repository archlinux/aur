# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=piedock
pkgver=1.6.1
pkgrel=3
pkgdesc="A task bar and application launcher in shape of a circular pie menu."
arch=(i686 x86_64)
url="http://www.markusfisch.de/"
license=('custom:MIT')
depends=('libpng' 'libxft' 'libxmu')
optdepends=('gnome-icon-theme: default icons')
install="$pkgname.install"
source=("${url}downloads/$pkgname-$pkgver.tar.bz2"
        "$pkgname.desktop")
md5sums=('ffb2b647ed2b4246d2d9cb072b9b5dcf'
         '3dc3675e073fd1172249e9f42f18f3cf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/^$/#include <unistd.h>/;t' src/Application.cpp
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # configuration file
  install -Dm644 res/${pkgname}rc.sample \
    "$pkgdir/usr/share/$pkgname/${pkgname}rc.sample"

  # additional icons
  cp -a res/window-control \
    "$pkgdir/usr/share/$pkgname"

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
