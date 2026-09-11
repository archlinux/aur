# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='dimemas'
pkgdesc='High-abstracted network simulator for message-passing programs (from BSC).'
pkgver='5.6.0.20260910'
pkgrel='1'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL-2.1-or-later')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        "0001-Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch")
sha512sums=(27d66c3e9b2ebf8d6daa2baf5669e4fa9f62e592f8b097f3ef5588adbb89e744c1874b86f7b0151eeb75e263f62c69b690d7eac136515bef949f720ffe9492f3
            4a72a6d8816310887c41a13946292f1dfa5b92768cd53cd1076700f3660b841fd82559a6f1e8f24c70711d487f6f5ab66ab33e20f0ea0bd18e5eeb6ea7341b48)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	patch -Np1 -i "$srcdir/0001-Honor-SOURCE_DATE_EPOCH-for-reproducible-builds.patch"

	autoreconf -i -f
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# Force-disable the use of TBB. Fixes the build when 'onetbb' is installed,
	# which otherwise fails due to macro conflicts & linking errors.
	export CXXFLAGS="$CXXFLAGS -D_GLIBCXX_USE_TBB_PAR_BACKEND=0"

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
