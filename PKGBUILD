# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>

pkgbase=mariadb-10.3
pkgname=('libmariadbclient-10.3' 'mariadb-clients-10.3' 'mytop-10.3' 'mariadb-10.3')
pkgver=10.3.9
pkgrel=1
arch=('x86_64')
license=('GPL')
url='http://mariadb.org/'
makedepends=('boost' 'bzip2' 'cmake' 'jemalloc' 'libaio' 'libxml2' 'lz4' 'lzo'
             'openssl' 'systemd' 'zlib')
validpgpkeys=('199369E5404BD5FC7D2FE43BCBCB082A1BB943DB') # MariaDB Package Signing Key <package-signing-key@mariadb.org>
source=("https://ftp.heanet.ie/mirrors/mariadb/mariadb-$pkgver/source/mariadb-$pkgver.tar.gz"{,.asc})
sha256sums=('561c6969bbd24dbb22d1d196a6b037665389b91e6dab881f39c5616389f156f4'
            'SKIP')

prepare() {
  cd ${pkgbase%-10.3}-$pkgver/

  # Changes to the upstream unit files:
  #  * remove the alias from unit files, we install symlinks in package function
  #  * enable PrivateTmp for a little bit more security
  sed -i -e '/^Alias/d' \
    -e '/^PrivateTmp/c PrivateTmp=true' \
    support-files/mariadb{,@}.service.in

  # let's create the datadir from tmpfiles
  echo 'd @MYSQL_DATADIR@ 0700 @MYSQLD_USER@ @MYSQLD_USER@ -' >> support-files/tmpfiles.conf.in
}

build() {
  mkdir -p build
  cd build

  cmake ../${pkgbase%-10.3}-$pkgver \
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

package_libmariadbclient-10.3() {
  pkgdesc='MariaDB client libraries'
  depends=('bzip2' 'libaio' 'lz4' 'lzo' 'openssl' 'xz' 'zlib')
  conflicts=('libmysqlclient' 'libmariadbclient')
  provides=("libmariadbclient=$pkgver")

  cd build

  for dir in libmariadb libmysqld libservices include; do
    make -C $dir DESTDIR="$pkgdir" install
  done

  install -D -m0755 scripts/mysql_config "$pkgdir"/usr/bin/mysql_config
  install -D -m0644 "$srcdir"/${pkgbase%-10.3}-$pkgver/man/mysql_config.1 "$pkgdir"/usr/share/man/man1/mysql_config.1

  install -D -m0644 support-files/mariadb.pc "$pkgdir"/usr/share/pkgconfig/mariadb.pc
  install -D -m0644 "$srcdir"/${pkgbase%-10.3}-$pkgver/support-files/mysql.m4 "$pkgdir"/usr/share/aclocal/mysql.m4

  ln -s libmariadb.so.3 "$pkgdir"/usr/lib/libmysqlclient.so.18

  # remove static libraries
  rm "$pkgdir"/usr/lib/*.a
}

package_mariadb-clients-10.3() {
  pkgdesc='MariaDB client tools'
  depends=("libmariadbclient-10.3=${pkgver}" 'jemalloc')
  conflicts=('mysql-clients' 'mariadb-clients')
  provides=("mysql-clients=$pkgver" "mariadb-clients=$pkgver")

  cd build

  make -C client DESTDIR="$pkgdir" install

  # install man pages
  for man in mysql mysql_plugin mysql_upgrade mysqladmin mysqlbinlog mysqlcheck mysqldump mysqlimport mysqlshow mysqlslap mysqltest; do
    install -D -m0644 "$srcdir"/${pkgbase%-10.3}-$pkgver/man/$man.1 "$pkgdir"/usr/share/man/man1/$man.1
  done
}

package_mytop-10.3() {
  pkgdesc='Top clone for MariaDB'
  depends=('perl' 'perl-dbd-mysql' 'perl-term-readkey')
  conflicts=('mytop')
  provides=("mytop=$pkgver")

  cd build

  install -Dm0755 scripts/mytop "$pkgdir"/usr/bin/mytop
}

package_mariadb-10.3() {
  pkgdesc='Fast SQL database server, drop-in replacement for MySQL'
  backup=('etc/mysql/my.cnf')
  install=mariadb.install
  depends=("mariadb-clients-10.3=${pkgver}" 'inetutils' 'libsystemd' 'libxml2')
  optdepends=('galera: for MariaDB cluster with Galera WSREP'
              'perl-dbd-mysql: for mysqlhotcopy, mysql_convert_table_format and mysql_setpermission')
  conflicts=('mysql' 'mariadb')
  provides=("mysql=$pkgver" "mariadb=$pkgver")
  options=('emptydirs')

  cd build

  make DESTDIR="$pkgdir" install

  cd "$pkgdir"

  mkdir etc/my.cnf.d

  mv usr/lib/sysusers.d/{sysusers,mariadb}.conf
  mv usr/lib/tmpfiles.d/{tmpfiles,mariadb}.conf

  ln -s mariadb.service usr/lib/systemd/system/mysqld.service
  ln -s mariadb@.service usr/lib/systemd/system/mysqld@.service

  # move to proper licenses directories
  install -d usr/share/licenses/mariadb
  mv usr/share/doc/mariadb/COPYING* usr/share/licenses/mariadb/

  # already installed to real systemd unit directory
  rm -r usr/share/mysql/systemd/

  # left over from sysvinit
  rm usr/bin/rcmysql

  # provided by libmariadbclient
  rm usr/bin/{mysql,mariadb}_config
  rm usr/lib/lib{mysql,mariadb}*
  rm usr/lib/mysql/plugin/{auth_gssapi_client.so,dialog.so,mysql_clear_password.so,sha256_password.so}
  rm usr/share/man/man1/mysql_config.1
  rm -r usr/include/
  rm -r usr/share/mysql/{aclocal,pkgconfig}

  # provided by mariadb-clients
  rm usr/bin/{mysql,mysql_plugin,mysql_upgrade,mysqladmin,mysqlbinlog,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap,mysqltest}
  rm usr/share/man/man1/{mysql,mysql_plugin,mysql_upgrade,mysqladmin,mysqlbinlog,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap,mysqltest}.1

  # provided by mytop
  rm usr/bin/mytop

  # not needed
  rm -r usr/{data,mysql-test,sql-bench}
  rm usr/share/man/man1/mysql-test-run.pl.1
}
