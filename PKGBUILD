# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mydumper
pkgver=0.6.2
_myver=5.6.24
pkgrel=3
pkgdesc="A high performance MySQL backup tool."
arch=("i686" "x86_64")
url="https://launchpad.net/mydumper"
license=('GPL')
depends=("glib2" "pcre" "libmysqlclient")
makedepends=("cmake" "python2-sphinx")

source=("http://launchpad.net/mydumper/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        "http://ftp.gwdg.de/pub/misc/mysql/Downloads/MySQL-5.6/mysql-$_myver.tar.gz"
        "mysql-cmake.patch"
        "mysql-compat.patch")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/mysql-cmake.patch"
	patch -p1 -i "$srcdir/mysql-compat.patch"
	sed -r 's/sphinx-build$/sphinx-build2/' -i cmake/modules/FindSphinx.cmake
}

build() {
	cd "${srcdir}"
	rm -rf build-mysql
	mkdir build-mysql
	cd build-mysql

	cmake "$srcdir/mysql-$_myver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSYSCONFDIR=/etc/mysql \
		-DMYSQL_DATADIR=/var/lib/mysql \
		-DMYSQL_UNIX_ADDR=/run/mysqld/mysqld.sock \
		-DDEFAULT_CHARSET=utf8 \
		-DDEFAULT_COLLATION=utf8_general_ci \
		-DENABLED_LOCAL_INFILE=ON \
		-DINSTALL_INFODIR=share/mysql/docs \
		-DINSTALL_MANDIR=share/man \
		-DINSTALL_PLUGINDIR=lib/mysql/plugin \
		-DINSTALL_SCRIPTDIR=bin \
		-DINSTALL_INCLUDEDIR=include/mysql \
		-DINSTALL_DOCREADMEDIR=share/mysql \
		-DINSTALL_SUPPORTFILESDIR=share/mysql \
		-DINSTALL_MYSQLSHAREDIR=share/mysql \
		-DINSTALL_DOCDIR=share/mysql/docs \
		-DINSTALL_SHAREDIR=share/mysql \
		-DWITH_READLINE=ON \
		-DWITH_ZLIB=system \
		-DWITH_SSL=system \
		-DWITH_LIBWRAP=OFF \
		-DWITH_LIBEDIT=OFF \
		-DWITH_UNIT_TESTS=OFF \
		-DWITH_EXTRA_CHARSETS=complex \
		-DWITH_EMBEDDED_SERVER=ON \
		-DWITH_INNODB_MEMCACHED=ON \
		-DWITH_INNOBASE_STORAGE_ENGINE=ON \
		-DWITH_PARTITION_STORAGE_ENGINE=ON \
		-DWITH_PERFSCHEMA_STORAGE_ENGINE=ON \
		-DWITH_ARCHIVE_STORAGE_ENGINE=ON \
		-DWITH_BLACKHOLE_STORAGE_ENGINE=ON \
		-DWITH_FEDERATED_STORAGE_ENGINE=OFF \
		-DWITH_EXAMPLE_STORAGE_ENGINE=OFF \
		-DCMAKE_C_FLAGS="-fPIC $CFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer" \
		-DCMAKE_CXX_FLAGS="-fPIC $CXXFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti" \
		-DWITH_MYSQLD_LDFLAGS="$LDFLAGS"
	make

	cd "${srcdir}"
	rm -rf build-mydumper
	mkdir build-mydumper
	cd build-mydumper

	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DMYSQL_INCLUDE_DIR="$srcdir/mysql-$_myver/include" \
		-DEXTRA_INCLUDE_DIR="/usr/include/mysql" \
		-DEXTRA_CFLAGS="-L../build-mysql/libmysql" \
		-DMYSQL_CFLAGS="-lm"
	make VERBOSE=1
}

package() {
	cd "$srcdir/build-mydumper"
	make DESTDIR="$pkgdir" install
}

sha256sums=('fa28563e8967752828954c5d81e26ef50aad9083d50a977bf5733833b23e3330'
            '37e27305b67d76883c5902dce59c89d596beee9dca7dbadd4a2e117f8101dfeb'
            'e6b7d938cc5882cad564103f6e367c1babaccb624587c96e9e6c349e58e7ede4'
            '9b35858057d82948579f43d8b95605a88d80580412bf5ed1daf992c092ca4edf')
