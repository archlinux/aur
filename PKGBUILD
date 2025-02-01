# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='dimemas'
pkgdesc='High-abstracted network simulator for message-passing programs (from BSC).'
pkgver='5.4.2.20210310'
pkgrel='4'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        "0001-Enable-Lex-noyywrap-option-so-no-LEXLIB-is-needed.patch"
        "0001-Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch")
sha512sums=(5fe41152c583d2d4bc08ab939f9ca5f7599a4dc414cc6445db2fecf13093322f9f6ab9ef84411337fe9e3854bef40181830bc9a7e5319d86deb3fc1c0d0061d4
            87a5cbb5282dfb283668073ae7f925a7e3ccedb7162cab7423e3a9e089d4503122a5842b1ca3be40c3a17c4ac639ecbb4bd832fa03b694721ce9322421e42fce
            4a72a6d8816310887c41a13946292f1dfa5b92768cd53cd1076700f3660b841fd82559a6f1e8f24c70711d487f6f5ab66ab33e20f0ea0bd18e5eeb6ea7341b48)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	patch -Np1 -i "$srcdir/0001-Enable-Lex-noyywrap-option-so-no-LEXLIB-is-needed.patch"
	rm Simulator/input/lex.c # Force the file to be re-generated from the Lex input
	patch -Np1 -i "$srcdir/0001-Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch"

	autoreconf -i -f
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# For now, ignore new errors from GCC 14 (see https://gcc.gnu.org/gcc-14/porting_to.html)
	export CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration"

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
