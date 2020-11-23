# Maintainer: Markus Heidelberg <markus dot heidelberg at web dot de>
# Contributor: Stefano "GeniE" Faraone <xgotux@gmail.com>

pkgname=njam
pkgver=1.25
pkgrel=9
pkgdesc="Full-featured cross-platform pacman-like game"
arch=('i686' 'x86_64')
url="http://njam.sourceforge.net/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_net')
source=(http://deb.debian.org/debian/pool/main/n/$pkgname/${pkgname}_$pkgver.orig.tar.gz
	njam.desktop
	njam-1.25-debian-src.patch
	CASE.COOP
	CAT.COOP
	CLAASSYM.DUEL
	PACMAN.DUEL
	ROOMS.COOP
	RUN.COOP
	SNERTGAME.DUEL
	TIME.COOP
	TOTALY_IMPOSSIBLE.COOP
	WEISSBIER.COOP
	njam-1.25-gcc45-archlinux.patch)
md5sums=('231fda022d309e1ef4a0d993ca693462'
	'a2e8f7e419de1b864c31342003ebcd4d'
	'615b4c5395d31ec09b2459843a3f1311'
	'f4b8a42967b34ec920b87f8ee1e6790a'
	'1bd67a5d315a4691220389f10fd90f27'
	'1b5bb57d1b39586a633c7dc932cb4795'
	'38b5ed7dc76bc36fd7c14ef5985e1e30'
	'f2a91508a47c3d13f11deb3aab02ecdb'
	'66225a96c323211e68c93dbe3f46fa18'
	'0fd169ed7d7a57c12f835249525898df'
	'22418c9860f08e479238a8fa6aa59525'
	'1d1af2b2a1d0a2c0c7f840a697f26ebb'
	'2fe5b30304cec91849bb8c784a41130a'
	'0add7095857fe517d35abdbd79e25259')

prepare() {
	cd "$srcdir/$pkgname-$pkgver-src"
	patch -p1 < "$srcdir/njam-1.25-debian-src.patch"
	cp \
		"$srcdir/CASE.COOP" \
		"$srcdir/CAT.COOP" \
		"$srcdir/CLAASSYM.DUEL" \
		"$srcdir/PACMAN.DUEL" \
		"$srcdir/ROOMS.COOP" \
		"$srcdir/RUN.COOP" \
		"$srcdir/SNERTGAME.DUEL" \
		"$srcdir/TIME.COOP" \
		"$srcdir/TOTALY_IMPOSSIBLE.COOP" \
		"$srcdir/WEISSBIER.COOP" \
		"levels/"
	patch -p0 < "$srcdir/njam-1.25-gcc45-archlinux.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver-src"
	./configure --prefix=/usr
	make clean # Delete the binary files which are distributed in the tar file
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver-src"
	make DESTDIR="$pkgdir/" install
	chgrp root "$pkgdir/usr/share/njam/hiscore.dat"
	chmod 644 "$pkgdir/usr/share/njam/hiscore.dat"
	install -Dm644 njamicon.ico "$pkgdir/usr/share/pixmaps/njamicon.ico"
	install -Dm644 "$srcdir/njam.desktop" "$pkgdir/usr/share/applications/njam.desktop"
}
