# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='dimemas'
pkgdesc='High-abstracted network simulator for message-passing programs (from BSC).'
pkgver='5.4.1.20190802'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2")
sha512sums=(2eb05e0cf48f6e3ae8a6af31910da09559e0b6730e4506c9c8ce17e1f158155f0314d61ae1a8fd2c2c0b0fd3f61fd4dbf993d2ec82c91f151c6ac526af99aaee)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: See https://github.com/brianb/mdbtools/issues/47
	sed -i 's/LIBS="$LIBS $LEXLIB"//g' configure.ac
	sed -i '1s/^/%option noyywrap\n/' Simulator/input/lex.l

	autoreconf -i -f
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# NOTE: The following optional features are NOT enabled:
	# * Java GUI
	./configure \
		--prefix=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	make DESTDIR="$pkgdir/" install
}