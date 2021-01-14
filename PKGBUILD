# Maintainer: Dominic Radermacher <blip@mockmoon-cybernetics.ch>
_pkgbasename='mariadb-connector-c'
pkgname=lib32-${_pkgbasename}
pkgver=3.1.11
pkgrel=1
pkgdesc='MariaDB connector libraries for C/C++'
arch=('x86_64')
license=('GPL')
url='http://mariadb.org/'
depends=('lib32-openssl' 'lib32-krb5' 'lib32-curl')
makedepends=('cmake' 'zlib' 'libaio' 'libxml2' 'openssl' 'pcre' 'lz4')
conflicts=('lib32-libmysqlclient')
source=("https://downloads.mariadb.org/interstitial/connector-c-${pkgver}/mariadb-connector-c-${pkgver}-src.tar.gz")
sha256sums=('3e6f6c399493fe90efdc21a3fe70c30434b7480e8195642a959f1dd7a0fa5b0f')

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	cd ${_pkgbasename}-${pkgver}-src
	cmake ../${_pkgbasename}-${pkgver}-src \
	-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd ${_pkgbasename}-${pkgver}-src
	make DESTDIR="${pkgdir}" install
	cd ${pkgdir}/usr
	# Ugly hack, I didn't manage to get cmake use CMAKE_INSTALL_LIBDIR
	mkdir lib32
	mv lib/mariadb/* lib32
	rm -rf lib bin
}
