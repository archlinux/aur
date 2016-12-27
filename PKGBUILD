# Maintainer: Raphael Dümig <duemig@in.tum.de>

pkgname=osm2pgsql-git
pkgver=0.92.0.RC1.r34.g3ca10bb
pkgrel=1
pkgdesc="tool for loading OpenStreetMap data into a PostgreSQL / PostGIS database"
arch=('i686' 'x86_64')
url="https://github.com/openstreetmap/osm2pgsql"
license=('GPL')
depends=('expat' 'geos' 'proj' 'postgresql-libs' 'boost-libs')
makedepends=('boost' 'cmake' 'lua')
optdepends=('lua: used for Lua tag transforms'
	'postgresql: for creating a PostgreSQL database'
	'postgis: for creating a PostGIS database')
source=("$pkgname::git+https://github.com/openstreetmap/osm2pgsql.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build &&	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir/" install
	cd ../
	install install-postgis-osm-{db,user}.sh "$pkgdir/usr/bin"
}
