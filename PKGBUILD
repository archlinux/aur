# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=xscorch
pkgver=0.2.1
pkgrel=3
pkgdesc="A clone of the classic DOS game Scorched Earth"
depends=('gtk2' 'libmikmod')
arch=('i686' 'x86_64')
license=('GPL2')
#url="http://xscorch.org"
#url="http://freshmeat.sourceforge.net/projects/xscorch"
url="https://packages.debian.org/sid/games/xscorch"
source=("http://deb.debian.org/debian/pool/main/x/xscorch/xscorch_$pkgver.orig.tar.gz"
        "http://deb.debian.org/debian/pool/main/x/xscorch/xscorch_$pkgver-1+nmu4.debian.tar.xz"
        "$pkgname.desktop")
md5sums=('9c3a08cc97242ff9a1fad010dc40d9a7'
         'adc98fc3984ee26b23d78816b65241b8'
         '31b8021889053c13058b13c79af87d48')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/debian/patches/overlapping-memcpy"
  patch -p1 -i "$srcdir/debian/patches/gdk-include"
  patch -p1 -i "$srcdir/debian/patches/gcc10.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -dm755 "$pkgdir/usr/share/pixmaps"

  ln -s /usr/share/$pkgname/images/$pkgname-icon.xpm "$pkgdir/usr/share/pixmaps/$pkgname-icon.xpm"

  mv "$pkgdir/usr/man" "$pkgdir/usr/share/"
  rm -r "$pkgdir/usr/include"
}
