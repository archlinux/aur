# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='dimemas'
pkgdesc='High-abstracted network simulator for message-passing programs (from BSC).'
pkgver='5.4.1'
pkgrel='3'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(0e8757d8696953b1e0e1fc475fe5d9e751a58570b2499f74a9407db34b1b4933147d6ce39495b3b76bc7361d87fa5baa501f2d0211ba5c8df21b275f96f3d192)

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