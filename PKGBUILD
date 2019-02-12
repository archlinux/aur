# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>
# Contributor: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>

pkgbase=mariadb-10.3
pkgname=('libmariadb-10.3' 'mariadb-clients-10.3' 'mytop-10.3' 'mariadb-10.3')
pkgver=10.3.12
pkgrel=3
arch=('x86_64')
license=('GPL')
url='http://mariadb.org/'
makedepends=('boost' 'bzip2' 'cmake' 'jemalloc' 'libaio' 'libxml2' 'lz4' 'lzo'
             'openssl' 'systemd' 'zlib')
validpgpkeys=('199369E5404BD5FC7D2FE43BCBCB082A1BB943DB') # MariaDB Package Signing Key <package-signing-key@mariadb.org>

source=("https://mirrors.ukfast.co.uk/sites/mariadb/mariadb-$pkgver/source/mariadb-$pkgver.tar.gz"{,.asc}
        fix_libmariadb_ignored_host.patch
        fix_cmake_compiler_flag_tests.patch)
sha256sums=('f7449a34c25e0455928d7983dae83fd2069fe1f16c4c5f4aeed9ed9d3f081ff6'
            'SKIP'
            'fd186c795c393b6898f28d731390bb14ea8444230c8340a5f4cfbccb16ea10e9'
            '80594a8427106aa99186d0e2af3d8d37c49a4d4cf811d049d1ebb0e4a75fcdb0')

prepare() {
  cd ${pkgbase%-10.3}-$pkgver/

  # Changes to the upstream unit files:
  #  * remove the alias from unit files, we install symlinks in package function
  #  * enable PrivateTmp for a little bit more security
  sed -i -e '/^Alias/d' \
    -e '/^PrivateTmp/c PrivateTmp=true' \
    support-files/mariadb{,@}.service.in

  # Disable networking by default for security reasons and use only the socket
  sed -i '/\[server\]/ a skip-networking' support-files/rpm/server.cnf

  # let's create the datadir from tmpfiles
  echo 'd @MYSQL_DATADIR@ 0700 @MYSQLD_USER@ @MYSQLD_USER@ -' >> support-files/tmpfiles.conf.in

  # Fix that libmariadb ignores the host from .my.cnf files
  # More info: https://jira.mariadb.org/browse/CONC-359
  patch -p0 < ../fix_libmariadb_ignored_host.patch

  # Fix a cmake error on non-english systems
  # More info: https://jira.mariadb.org/browse/MDEV-18273
  patch -p1 < ../fix_cmake_compiler_flag_tests.patch

  # fix path to our config
  sed -i 's|my.cnf.d|mysql/my.cnf.d|' support-files/rpm/{my.cnf,enable_encryption.preset}
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
    -DINSTALL_UNIX_ADDRDIR=/run/mysqld/mysqld.sock \
    -DDEFAULT_CHARSET=utf8mb4 \
    -DDEFAULT_COLLATION=utf8mb4_unicode_ci \
    -DENABLED_LOCAL_INFILE=ON \
    -DINSTALL_DOCDIR=share/doc/mariadb \
    -DINSTALL_DOCREADMEDIR=share/doc/mariadb \
    -DINSTALL_MANDIR=share/man \
    -DINSTALL_PLUGINDIR=lib/mysql/plugin \
    -DINSTALL_SCRIPTDIR=bin \
    -DINSTALL_SYSCONFDIR=/etc/mysql \
    -DINSTALL_SYSCONF2DIR=/etc/mysql/my.cnf.d \
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
    -DWITH_JEMALLOC=yes \
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
    -DCMAKE_C_FLAGS="-fPIC $CFLAGS -fno-strict-aliasing -fomit-frame-pointer -fno-delete-null-pointer-checks" \
    -DCMAKE_CXX_FLAGS="-fPIC $CXXFLAGS -fno-strict-aliasing -felide-constructors -fno-rtti -fno-delete-null-pointer-checks" \
    -DWITH_MYSQLD_LDFLAGS="-pie ${LDFLAGS},-z,now"

  make
}

package_libmariadb-10.3() {
  pkgdesc='MariaDB client libraries'
  depends=('bzip2' 'libaio' 'lz4' 'lzo' 'openssl' 'xz' 'zlib')
  conflicts=('libmysqlclient' 'libmariadbclient' 'libmariadbclient-10.3' 'libmariadb')
  replaces=('libmariadbclient-10.3')
  provides=("libmariadb=$pkgver" "libmariadbclient=$pkgver")

  cd build

  for dir in libmariadb libmysqld libservices include; do
    make -C $dir DESTDIR="$pkgdir" install
  done

  ln -s mariadb_config "$pkgdir"/usr/bin/mysql_config

  install -D -m0644 support-files/mariadb.pc "$pkgdir"/usr/share/pkgconfig/mariadb.pc
  install -D -m0644 "$srcdir"/${pkgbase%-10.3}-$pkgver/support-files/mysql.m4 "$pkgdir"/usr/share/aclocal/mysql.m4

  ln -s libmariadb.so.3 "$pkgdir"/usr/lib/libmysqlclient.so.18
  ln -s libmariadb.so.3 "$pkgdir"/usr/lib/libmariadb.so.2

  # remove static libraries
  rm "$pkgdir"/usr/lib/*.a
}

package_mariadb-clients-10.3() {
  pkgdesc='MariaDB client tools'
  depends=("libmariadb-10.3=${pkgver}" 'jemalloc')
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

  install -D -m0755 scripts/mytop "$pkgdir"/usr/bin/mytop
}

package_mariadb-10.3() {
  pkgdesc='Fast SQL database server, drop-in replacement for MySQL'
  backup=('etc/mysql/my.cnf'
          'etc/mysql/my.cnf.d/client.cnf'
          'etc/mysql/my.cnf.d/mysql-clients.cnf'
          'etc/mysql/my.cnf.d/server.cnf')
  install=mariadb.install
  depends=("mariadb-clients-10.3=${pkgver}" 'inetutils' 'libsystemd' 'libxml2')
  optdepends=('galera: for MariaDB cluster with Galera WSREP'
              'perl-dbd-mysql: for mysqlhotcopy, mysql_convert_table_format and mysql_setpermission')
  conflicts=('mysql' 'mariadb')
  provides=("mysql=$pkgver" "mariadb=$pkgver")

  cd build

  make DESTDIR="$pkgdir" install

  cd "$pkgdir"

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
  rm -r etc/mysql/{init.d,logrotate.d}
  rm usr/share/mysql/{binary-configure,mysql.server,mysqld_multi.server}
  rm usr/bin/rcmysql

  # provided by libmariadb
  rm usr/bin/{mysql,mariadb}_config
  rm usr/lib/lib{mysql,mariadb}*
  rm usr/lib/mysql/plugin/{auth_gssapi_client,dialog,mysql_clear_password,sha256_password,caching_sha2_password}.so
  rm usr/share/man/man1/mysql_config.1
  rm -r usr/include/
  rm -r usr/share/mysql/aclocal
  rm -r usr/lib/pkgconfig

  # provided by mariadb-clients
  rm usr/bin/{mysql,mysql_plugin,mysql_upgrade,mysqladmin,mysqlbinlog,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap,mysqltest}
  rm usr/share/man/man1/{mysql,mysql_plugin,mysql_upgrade,mysqladmin,mysqlbinlog,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap,mysqltest}.1

  # provided by mytop
  rm usr/bin/mytop

  # not needed
  rm -r usr/{data,mysql-test,sql-bench}
  rm usr/share/man/man1/mysql-test-run.pl.1
}
