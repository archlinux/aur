# Maintainer: Smit S. Patil <smit17av@gmail.com>

pkgname=mariadb-all
_pkgname=mariadb
pkgver=10.3.7
pkgrel=1
pkgdesc="Latast MariaDB package contaning libmariadbclient mariadb-clients mytop mariadb"
arch=('x86_64')
url="https://mariadb.com"
license=('GPL')
groups=()
depends=('bzip2' 'libaio' 'lz4' 'lzo' 'openssl' 'xz' 'zlib' 'perl' 'perl-dbd-mysql' 'perl-term-readkey' "mariadb-clients=${pkgver}" 'inetutils' 'libsystemd' 'libxml2')
makedepends=('boost' 'bzip2' 'cmake' 'libaio' 'libxml2' 'lz4' 'lzo'
             'openssl' 'systemd' 'zlib')
provides=("mariadb=${pkgver}" "libmariadbclient=${pkgver}" "mariadb-clients=${pkgver}" "mytop=${pkgver}")
conflicts=("mytop" "mariadb" "libmariadbclient" "mariadb-clients")
replaces=("mytop" "mariadb" "libmariadbclient" "mariadb-clients")
backup=('etc/mysql/my.cnf'
  'etc/mysql/wsrep.cnf')
options=()
install=mariadb.install
validpgpkeys=('199369E5404BD5FC7D2FE43BCBCB082A1BB943DB')
source=("https://ftp.heanet.ie/mirrors/mariadb/mariadb-$pkgver/source/mariadb-$pkgver.tar.gz"
		"https://ftp.heanet.ie/mirrors/mariadb/mariadb-$pkgver/source/mariadb-$pkgver.tar.gz.asc")
sha256sums=('e990afee6ae7cf9ac40154d0e150be359385dd6ef408ad80ea30df34e2c164cf' 'SKIP')

build() {

	mkdir -p build
	cd build

	cmake ../$_pkgname-$pkgver \
	-DCMAKE_AR=/usr/bin/gcc-ar \
	-DCMAKE_RANLIB=/usr/bin/gcc-ranlib \
	-DBUILD_CONFIG=mysql_release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DMYSQL_DATADIR=/var/lib/mysql \
	-DMYSQL_UNIX_ADDR=/run/mysqld/mysqld.sock \
	-DDEFAULT_CHARSET=utf8mb4 \
	-DDEFAULT_COLLATION=utf8mb4_unicode_ci \
	-DENABLED_LOCAL_INFILE=ON \
	-DINSTALL_DOCDIR=share/doc/mariadb \
	-DINSTALL_DOCREADMEDIR=share/doc/mariadb \
	-DINSTALL_MANDIR=share/man \
	-DINSTALL_PLUGINDIR=lib/mysql/plugin \
	-DINSTALL_SCRIPTDIR=bin \
	-DINSTALL_SYSCONFDIR=/etc/mysql \
	-DINSTALL_SYSCONF2DIR=/etc/mysql \
	-DINSTALL_INCLUDEDIR=include/mysql \
	-DINSTALL_SUPPORTFILESDIR=share/mysql \
	-DINSTALL_MYSQLSHAREDIR=share/mysql \
	-DINSTALL_SHAREDIR=share/mysql \
	-DINSTALL_SYSTEMD_SYSUSERSDIR=/usr/lib/sysusers.d/ \
	-DINSTALL_SYSTEMD_TMPFILESDIR=/usr/lib/tmpfiles.d/ \
	-DINSTALL_SYSTEMD_UNITDIR=/usr/lib/systemd/system/ \
	-DWITH_SYSTEMD=yes \
	-DWITH_READLINE=ON \
	-DWITH_ZLIB=system \
	-DWITH_SSL=system \
	-DWITH_PCRE=bundled \
	-DWITH_LIBWRAP=OFF \
	-DWITH_JEMALLOC=ON \
	-DWITH_EXTRA_CHARSETS=complex \
	-DWITH_EMBEDDED_SERVER=ON \
	-DWITH_ARCHIVE_STORAGE_ENGINE=1 \
	-DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
	-DWITH_INNOBASE_STORAGE_ENGINE=1 \
	-DWITH_PARTITION_STORAGE_ENGINE=1 \
	-DWITH_TOKUDB_STORAGE_ENGINE=1 \
	-DWITHOUT_EXAMPLE_STORAGE_ENGINE=1 \
	-DWITHOUT_FEDERATED_STORAGE_ENGINE=1 \
	-DWITHOUT_PBXT_STORAGE_ENGINE=1 \
	-DCMAKE_C_FLAGS="-fPIC $CFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer -fno-delete-null-pointer-checks" \
	-DCMAKE_CXX_FLAGS="-fPIC $CXXFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti -fno-delete-null-pointer-checks" \
	-DWITH_MYSQLD_LDFLAGS="-pie ${LDFLAGS},-z,now"

	make
}

package() {
	cd build
	pwd
	echo "$pkgdir"
	make DESTDIR="$pkgdir" install
	mkdir $pkgdir/etc/my.cnf.d
	rm "$pkgdir"/usr/lib/*.a
}

