# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='dimemas'
pkgdesc='High-abstracted network simulator for message-passing programs (from BSC).'
pkgver='5.4.1'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(b372005ce956668cc788c9b79093a57dfe81f2786d99283539ffef27fbd4cad2cb6b064db43e069bd215ea51c44f13fdf36455fbf1daf5a5c96be8151281594b)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# WORKAROUND: See https://github.com/brianb/mdbtools/issues/47
	sed -i 's/LIBS="$LIBS $LEXLIB"//g' configure.ac
	sed -i '1s/^/%option noyywrap\n/' Simulator/input/lex.l

	autoreconf -i -f
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# NOTE: The following optional features are NOT enabled:
	# * Java GUI
	./configure \
		--prefix=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}