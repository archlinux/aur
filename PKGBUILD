# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=mroonga
pkgver=9.10
pkgrel=1
pkgdesc="Fast fulltext search on MySQL(MariaDB and groonga bundled package)."
mariadbver=10.3.18
MYSQL_VERSION=mariadb-${mariadbver}
arch=('i686' 'x86_64')
url="http://mroonga.org/"
license=('LGPL2')
provides=("mysql-clients=$mariadbver" "mysql=$mariadbver" "libmysqlclient=$mariadbver")
source=(http://packages.groonga.org/source/mroonga/mroonga-$pkgver.tar.gz
        https://downloads.mariadb.org/f/${MYSQL_VERSION}/source/${MYSQL_VERSION}.tar.gz
        mariadb.service
        mariadb-post.sh
        mariadb-tmpfile.conf)
makedepends=('cmake' 'openssl' 'zlib' 'libaio' 'libxml2' 'pcre' 'jemalloc' 'lz4' )
conflicts=('libmariadbclient' 'mariadb-clients' 'mytop' 'mariadb' 'mysql' 'libmysqlclient' 'mysql-clients')
depends=('perl' 'inetutils' 'libaio' 'libxml2' 'pcre' 'groonga' 'groonga-normalizer-mysql')
optdepends=('cutter-test_framework' 'ruby' 'snowball-c')

prepare() {
    cd $srcdir/mariadb-$mariadbver
    rm -rf storage/mroonga
    cd $srcdir
    mkdir -p $srcdir/mariadb-$mariadbver/storage/mroonga
    mv $srcdir/mroonga-${pkgver}/* $srcdir/mariadb-$mariadbver/storage/mroonga
}

build() {
    cd $srcdir/mariadb-$mariadbver

    cmake . \
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
    -DCMAKE_EXE_LINKER_FLAGS='-ljemalloc' \
    -DCMAKE_C_FLAGS="-fPIC $CFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer -fno-delete-null-pointer-checks" \
    -DCMAKE_CXX_FLAGS="-fPIC $CXXFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti -fno-delete-null-pointer-checks" \
    -DWITH_MYSQLD_LDFLAGS="-pie ${LDFLAGS},-z,now"

    make
}

package() {
    backup=('etc/mysql/my.cnf')
    install=mariadb.install
    cd $srcdir/mariadb-$mariadbver

    install -D -m0644 support-files/mariadb.pc "$pkgdir"/usr/share/pkgconfig/mariadb.pc
    install -D -m0644 support-files/mysql.m4 "$pkgdir"/usr/share/aclocal/mysql.m4

    make DESTDIR="$pkgdir" install

    # not needed for using Mroonga just for testing.
    rm -r "$pkgdir"/usr/{data,mysql-test,sql-bench}
    rm "$pkgdir"/usr/share/man/man1/mysql-test-run.pl.1

    install -Dm755 ../mariadb-post.sh "$pkgdir"/usr/bin/mysqld-post
    install -Dm644 ../mariadb.service "$pkgdir"/usr/lib/systemd/system/mysqld.service
    install -Dm644 ../mariadb-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/mysql.conf
}
sha1sums=('4f8f3df3deff24a36e471e82e84c34724cc0b3c4'
          '922a317edd6f44baacc49831ca278e7a9878a363'
          '4bc34244fc4b578c155c8cd569d952a97a476f10'
          '206e9f7ba5357027becc2491e0987442f684d63e'
          'c2a86c745002923234f9d6d79b3b462d5ab55e8d')
