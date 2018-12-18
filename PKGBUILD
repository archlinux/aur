# Maintainer: VVL <me@ivvl.ru>
# Contributor: VVL <me@ivvl.ru>

pkgbase=mariadb-mainline-noconflict
_pkgbase=mariadb
pkgname=('mariadb-mainline-noconflict' 'libmariadbclient-mainline-noconflict' 'mariadb-clients-mainline-noconflict' 'mytop-mainline-noconflict')
pkgver=10.3.11
pkgrel=2
pkgdesk="MariaDB mainline version with libmysqlclient.so.18 (mariadb 10.1 compatible)"
arch=('x86_64')
license=('GPL')
url='http://mariadb.org/'
makedepends=('cmake' 'zlib' 'libaio' 'libxml2' 'openssl' 'jemalloc' 'lz4' 'boost' 'libevent' 'systemd' 'coreutils')
validpgpkeys=('199369E5404BD5FC7D2FE43BCBCB082A1BB943DB') # MariaDB Package Signing Key <package-signing-key@mariadb.org>
source=("https://ftp.heanet.ie/mirrors/mariadb/mariadb-$pkgver/source/mariadb-$pkgver.tar.gz"{,.asc})
sha256sums=('211655b794c9d5397ba3be6c90737eac02e882f296268299239db47ba328f1b2'
            'SKIP')

prepare() {
  cd $_pkgbase-$pkgver/

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
  mkdir build
  cd build

  cmake ../$_pkgbase-$pkgver \
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

  make -j$(nproc)
}

package_libmariadbclient-mainline-noconflict() {
  pkgdesc='MariaDB-mainline client libraries'
  depends=('openssl' 'libaio' 'zlib' 'lz4' 'lzo' 'xz')
  conflicts=('libmysqlclient' 'libmariadbclient')
  provides=("libmysqlclient=$pkgver" "libmariadbclient=$pkgver")

  cd build

  for dir in libmariadb libmysqld libservices include; do
    make -C $dir DESTDIR="$pkgdir" install
  done

  install -D -m0755 scripts/mysql_config "$pkgdir"/usr/bin/mysql_config
  install -D -m0644 "$srcdir"/$_pkgbase-$pkgver/man/mysql_config.1 "$pkgdir"/usr/share/man/man1/mysql_config.1

  install -D -m0644 support-files/mariadb.pc "$pkgdir"/usr/share/pkgconfig/mariadb.pc
  install -D -m0644 "$srcdir"/$_pkgbase-$pkgver/support-files/mysql.m4 "$pkgdir"/usr/share/aclocal/mysql.m4

  ln -s /usr/lib/libmariadb.so "$pkgdir/usr/lib/libmysqlclient.so.18"
  ln -s /usr/lib/libmariadb.so "$pkgdir/usr/lib/libmysqlclient_r.so.18"
  ln -s /usr/lib/libmariadbd.so "$pkgdir/usr/lib/libmysqld.so.18"
  # remove static libraries
  rm "$pkgdir"/usr/lib/*.a
}

package_mariadb-clients-mainline-noconflict() {
  pkgdesc='MariaDB-mainline client tools'
  depends=("libmariadbclient-mainline-noconflict=${pkgver}" 'zlib' 'openssl' 'jemalloc')
  conflicts=('mysql-clients' 'mariadb-clients')
  provides=("mysql-clients=$pkgver" "mariadb-clients=$pkgver")

  cd build

  make -C client DESTDIR="$pkgdir" install

  # install man pages
  for man in mysql mysql_plugin mysql_upgrade mysqladmin mysqlbinlog mysqlcheck mysqldump mysqlimport mysqlshow mysqlslap mysqltest; do
    install -D -m0644 "$srcdir"/$_pkgbase-$pkgver/man/$man.1 "$pkgdir"/usr/share/man/man1/$man.1
  done
}

package_mytop-mainline-noconflict() {
  pkgdesc='Top clone for MariaDB-mainline'
  depends=('perl' 'perl-dbd-mysql' 'perl-term-readkey')
  conflicts=('mytop')
  provides=("mytop=$pkgver")

  cd build

  install -Dm0755 scripts/mytop "$pkgdir"/usr/bin/mytop
}

package_mariadb-mainline-noconflict() {
  pkgdesc='MariaDB mainline version with libmysqlclient.so.18 (mariadb 10.1 compatible)'
  backup=('etc/mysql/my.cnf'
          'etc/mysql/wsrep.cnf')
  install=mariadb.install
  depends=("mariadb-clients-mainline-noconflict=${pkgver}" 'inetutils' 'libaio' 'libxml2' 'jemalloc'
           'lz4' 'boost-libs' 'lzo' 'libevent' 'libsystemd')
  optdepends=('galera: for MariaDB cluster with Galera WSREP'
              'perl-dbd-mysql: for mysqlhotcopy, mysql_convert_table_format and mysql_setpermission')
  conflicts=('mysql' 'mariadb')
  provides=("mysql=$pkgver" "mariadb=$pkgver")
  options=('emptydirs')

  cd build

  make DESTDIR="$pkgdir" install

  cd "$pkgdir"

  # We specified INSTALL_SYSCONFDIR and INSTALL_SYSCONF2DIR to have proper paths
  # in binaries and support file. But we want our own files...

  rm -r etc/

  install -Dm0644 usr/share/mysql/wsrep.cnf etc/mysql/wsrep.cnf

  #These folders/files don't exist anywhere
  mv usr/lib/sysusers.d/{sysusers,mariadb}.conf
  mv usr/lib/tmpfiles.d/{tmpfiles,mariadb}.conf
  #Temporary fix:
  #install -dm 0775 run/mysqld

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
  rm usr/bin/{mariadb_config,mysql_config}
  rm usr/lib/{libmysql*,libmariadb.so*,libmariadbd.so*}
  rm usr/lib/pkgconfig/libmariadb.pc
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
