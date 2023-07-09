# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='clusteringsuite'
pkgdesc='Automatically expose the main performance trends in applications'\'' computation structure (from BSC).'
pkgver='2.6.9.20230313'
pkgrel='2'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(libxml2 boost libbsctools)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        clusteringsuite-Build-fix-for-GCC-11-invocable-as-const.patch
        clusteringsuite-Fix-references-to-the-build-directory.patch)
sha512sums=(80233dbeb0bc419acaec37c96960fb0dde51630613eecc4312081d760c686e68cf07cf0cc6815b02e5ea63d9f0ca9ae0c93498aed1288ae5d989770186b31520
            e88047f3df0b1e0d6512741e33557cba336b282b7d6d52f380991dcdb3138c7cc72fbdf187a6d5c4fefe01c605153f939c21c5ba71df7ac448facafdcea678a5
            05a0c1a2d04f715b145e5ef98f29fa2ddfe45010c6ad4dce7b467ebaa552effb9b61836ad26b243348dfe4e480c47eaf96e5f56e4eb491f8034a1374627c8d3f)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# Fix build for GCC 11
	patch -Np1 -i "$srcdir/clusteringsuite-Build-fix-for-GCC-11-invocable-as-const.patch"

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
	# NOTE: Normally LibXML is correctly autodetected, so forcing the LibXML
	#       prefix should not be necessary, however, there's some homebrew LibXML
	#       detection logic (look for AX_PROG_XML2 in config/macros.m4) which
	#       fails in some scenarios, such as if /bin is before /usr/bin in PATH
	#       (thanks to @teleportex on AUR for the report and fix suggestion)
	XML2_CONFIG=/usr/bin/xml2-config ./configure \
		--prefix=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: Often fails with parallel install, so force make to run sequentially
	make DESTDIR="$pkgdir/" install -j1
}
