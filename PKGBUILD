# $Id$
# Maintainer: Pieter Lenaerts <pieter dot lenaerts at gmail.com>
# Contributer: Jeb Rosen <jeb@jebrosen.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash-dev
pkgver=2.7.8
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application (GTK3 development version)"
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('aqbanking' 'libdbi-drivers' 'libgnomecanvas' 'boost-libs' \
	 'slib' 'webkit2gtk')
optdepends=('evince: for print preview'
	    'perl-date-manip: for stock information lookups'
	    'perl-finance-quote: for stock information lookups')
makedepends=('git' 'intltool' 'boost' 'swig' 'gtest' 'gmock' 'cmake' 'sqlite3' 'libmariadbclient' 'postgresql-libs')
options=('!emptydirs')
conflicts=('gnucash' 'gnucash-devel' 'gnucash-latest' 'gnucash-git' 'gnucash-python' 'gnucash-xbt')
provides=('gnucash')
#source=("https://github.com/Gnucash/gnucash/releases/download/${pkgver}/gnucash-${pkgver}.tar.bz2")
source=("http://downloads.sourceforge.net/sourceforge/gnucash/gnucash-${pkgver}.tar.bz2")


build() {
	cd "$srcdir/${pkgname/-dev}-$pkgver"

	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
		-DWITH_OFX=ON \
		-DWITH_AQBANKING=ON \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo

	make VERBOSE=1
}

package() {
	cd "$srcdir/${pkgname/-dev}-$pkgver/build"

	make DESTDIR="${pkgdir}" install

	# TODO: tell cmake not to make this file in the first place
	rm -f "${pkgdir}"/usr/share/glib-2.0/schemas/*.compiled

	# Delete the gnucash-valgrind executable because the source files
	# are not included with the package and the executable is hardlinked
	# to the location that it was built at.
	rm -f "${pkgdir}"/usr/bin/gnucash-valgrind
}
md5sums=('13393d2c5c84905e065e1d2a098e913a')
