# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=xscorch
pkgver=0.2.1
pkgrel=4
pkgdesc="A clone of the classic DOS game Scorched Earth"
depends=('gtk2' 'libmikmod')
arch=('i686' 'x86_64')
license=('GPL2')
#url="http://xscorch.org"
#url="http://freshmeat.sourceforge.net/projects/xscorch"
url="https://packages.debian.org/sid/games/xscorch"
source=("http://deb.debian.org/debian/pool/main/x/xscorch/xscorch_0.2.1.orig.tar.gz"
        "http://deb.debian.org/debian/pool/main/x/xscorch/xscorch_0.2.1-1+nmu6.debian.tar.xz"
        "$pkgname.desktop")
sha256sums=('a315f7001a020c6b8f644db1c1dc56ccfbb9e3efcbf12c41ac9eb4e5e75cb5f7'
					 'b30969b4b5fc5ff3f42abdcbfaf254fc377a75b501c7fbb57e107c6331a0d10c'
           '614f3c41703930bbcfd0762647dc6e62403680c725d764fa4a8fecb34f7cc520')



prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/debian/patches/overlapping-memcpy"
  patch -p1 -i "$srcdir/debian/patches/gdk-include"
  patch -p1 -i "$srcdir/debian/patches/gcc10.patch"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -dm755 "$pkgdir/usr/share/pixmaps"

  ln -s /usr/share/$pkgname/images/$pkgname-icon.xpm "$pkgdir/usr/share/pixmaps/$pkgname-icon.xpm"

  mv "$pkgdir/usr/man" "$pkgdir/usr/share/"
  rm -r "$pkgdir/usr/include"
}
