# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=flmusic
pkgver=1.2.1
pkgrel=1
pkgdesc="Very simple CD/audio player application for FLTK"
arch=('i686' 'x86_64')
url="http://home.arcor.de/szukw000/english_index.html"
license=('LGPL')
depends=('fltk' 'sox')
makedepends=('gendesk')
source=(http://home.arcor.de/szukw000/$pkgname-fltk13-source-$pkgver.tgz)
md5sums=('1e2e1bd760a7f5ea583093537090c3ae')

prepare() {
	cd "$srcdir/$pkgname-fltk13-source-$pkgver"
	sed -i '/ioctl.h/a #include <limits.h>' reader.c
	sed -i 's/$(installdir)/$(DESTDIR)$(installdir)/' Makefile.in
	gendesk -n -f --pkgname=$pkgname --pkgdesc="Very simple CD/audio player" --categories="AudioVideo;Audio;Player"
}

build() {
	cd "$srcdir/$pkgname-fltk13-source-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-fltk13-source-$pkgver"
	install -dm755 "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir" install
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
