# $Id$
# Maintainer: Fritz Engelbrecht <fritz.engl+arch@gmail.com>

pkgname=imqs-mapnik-git
_pkgname=mapnik
pkgver=3.0.15
pkgrel=1
pkgdesc="Free Toolkit for developing mapping applications. Above all Mapnik is about rendering beautiful maps (imqs-git version)"
arch=('i686' 'x86_64')
url="http://mapnik.org/"
license=('LGPL')
depends=('boost-libs' 'icu' 'libpng' 'libjpeg' 'libtiff' 'freetype2'
	 'libxml2' 'python2' 'proj' 'cairo' 'cairomm' 'python-cairo'
	 'postgresql-libs' 'postgis' 'gdal' 'curl' 'libltdl' 'libwebp')
optdepends=('libxslt:         Web Map Service'
			'python2-lxml:    Web Map Service'
			'python2-pillow:  Web Map Service'
			'python-nose:     Web Map Service'
			'apache:          Web Map Service'
			'mod_fastcgi:     Web Map Service - or:'
			'mod_fcgid:       Web Map Service - or:'
			'mod_wsgi2:       Web Map Service')
makedepends=('scons' 'boost' 'git')
conflicts=('mapnik')
provides=('mapnik=3.0.15')
options=(staticlibs)
install="mapnik.install"
source=("git://github.com/IMQS/mapnik.git#branch=imqs-master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	echo "3.0.15"
}

prepare() {
	cd "$srcdir/$_pkgname"

	git checkout imqs-master

	# This is not how this should be done, will remove when fix is apply'd to repo
	git cherry-pick d3ec91b29b364681e393ff7910b883d7f22e2243

	git submodule update --init deps/mapbox
}

build() {
	cd "$srcdir/$_pkgname"

	scons configure \
		PREFIX="/usr" \
		INPUT_PLUGINS=all \
		DESTDIR="$pkgdir"
	scons $MAKEFLAGS
}

package(){
	cd "$srcdir/$_pkgname"
	make PYTHON=python2 DESTDIR="$pkgdir" install
}
