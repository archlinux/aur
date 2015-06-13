# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: ggrin <ggrin@lavabit.com>
pkgname=overgod
pkgver=1.0
pkgrel=4
pkgdesc="overgod is a shoot em up space game"
arch=('i686' 'x86_64')
url="http://www.allegro.cc/depot/Overgod"
license=('GPL')
depends=('allegro4')
source=(http://downloads.sourceforge.net/project/overgod/overgod/Overgod%201.0/overgod.tar.gz
	overgod.patch)
md5sums=('3bddd8d4e96c5e69ec07236de145799a'
	'5ab7c521b19d67f6c15aad496fa9d503')

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  patch -i  "$srcdir/overgod.patch" -d "$srcdir/$pkgname-$pkgver/"
  # shield_bmp is 22 elements long, but the loop accesses 8+16
  # probably more of these latent segfaults in the code
  # they seem to have been exposed by a change to gcc or allegro
  sed -i 's/; i < 8;/; i < 6;/' displ_in.c
  gcc -g -O2 -Wall -lm *.c -o overgod `allegro-config --cflags --libs`
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 overgod "$pkgdir/usr/bin/overgod"
  install -d "$pkgdir/usr/share/overgod"
  cp  "$srcdir/$pkgname-$pkgver/overgod"   "$pkgdir/usr/share/overgod/"
  cp -r "$srcdir/$pkgname-$pkgver/wavs"    "$pkgdir/usr/share/overgod/"
  cp -r "$srcdir/$pkgname-$pkgver/gfx"     "$pkgdir/usr/share/overgod/"
}
