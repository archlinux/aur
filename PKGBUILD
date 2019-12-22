# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='clusteringsuite'
pkgdesc='Automatically expose the main performance trends in applications'\'' computation structure (from BSC).'
pkgver='2.6.9.20190920'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(libxml2 boost libbsctools)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        clusteringsuite-Fix-references-to-the-build-directory.patch)
sha512sums=(80903e3d2c018e8ed23874715f7ffc1706ac5d9dcd0826c75bb07c973c28fa9755d4c130021abd6e969e983fbe23463be7361bb29b6d1ab04596ba4f987b1b6a
            05a0c1a2d04f715b145e5ef98f29fa2ddfe45010c6ad4dce7b467ebaa552effb9b61836ad26b243348dfe4e480c47eaf96e5f56e4eb491f8034a1374627c8d3f)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	patch -Np1 -i "$srcdir/clusteringsuite-Fix-references-to-the-build-directory.patch"

	# This package includes a version of one the libbsctools libraries by default,
	# which causes a conflict as both libraries would need to be installed
	# Basically, the next few lines disable compilation of the version included
	# in this package, and make the package rely on the libbsctools version instead
	sed -i '/.*pcfparser_svn3942.*/d' configure.ac
	sed -i 's/pcfparser_svn3942//g' Makefile.am
	sed -i 's/.*libparavertraceconfig\.la/-lparavertraceconfig/g' src/libSharedComponents/Makefile.am

	autoreconf -i -f -I config
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# NOTE: The following optional features are NOT enabled:
	# * CAPEK algorithm
	# * MRNet-based parallel DBSCAN
	# * LaTeX documentation
	./configure \
		--prefix=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: Often fails with parallel install, so force make to run sequentially
	make DESTDIR="$pkgdir/" install -j1
}
