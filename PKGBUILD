# Maintainer: gwhite <gwhite@kupulau.com>

pkgbase=postgresql-src
pkgname=('postgresql-src-libs' 'postgresql-src-docs' 'postgresql-src')
pkgver=13.1
_majorver=13.1
pkgrel=1
CFLAGS=`echo $CFLAGS | sed s/-Ofast/-O3/`
CFLAGS="${CFLAGS} -flto"
CXXFLAGS=`echo $CXXFLAGS | sed s/-Ofast/-O3/`
CXXFLAGS="${CFLAGS} -flto"
LDFLAGS=`echo $LDFLAGS | sed s/-Ofast/-O3/`
LDFLAGS="${CFLAGS} -flto"
arch=('aarch64' 'i686' 'x86_64')
url="http://www.postgresql.org/"
license=('custom:PostgreSQL')
makedepends=('python' 'perl' 'openssl>=1.0.0')
source=(http://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
        postgresql.pam 
        postgresql.logrotate
        postgresql.service 
        postgresql-check-db-dir)
sha512sums=('b7bd378db1dcb74ebcd5fffba03b82d8117d182029e4caca48eef62d8bcdbeef2c2e10f18eef0cdafb9d7acf21aa164d040e56687709f97b08c51540a786eeca'
            'aa0a82a6ba356d3ccd7b8c497dae19666368e3342eb52cb4b8c9f48b0bfcb8f66574c55ba39eb65565ebf66467e18e2a02ae467d78fc2c247c056af170b3ab35'
            '1e6183ab0eb812b3ef687ac2c26ce78f7cb30540f606d20023669ac00ba04075487fb72e4dc89cc05dab0269ff6aca98fc1167cc75669c225b88b592482fbf67'
            '9ab4da01337ffbab8faec0e220aaa2a642dbfeccf7232ef2645bdc2177a953f17ee3cc14a4d8f8ebd064e1dae8b3dba6029adbffb8afaabea383963213941ba8'
            'ec2625c3ccfb6c142ea12ef4392b00f3d4cb0a5411d603b98157d55cd162ed3b422dbbd42e8b13211063db94a42f6d1f3febd4acaadde69ea17bfd8eccae3539'
            'b6e849ab1d76cc51a19d8a8cf7792d2af1d45ec950e3ff366aaad57a9538bda7aaa651d0790ec5bf042b657b376323163973d6080119d4e9ce76c493609d7a76')

build() {
  cd "${srcdir}/postgresql-${pkgver}"

  patch -Np1 < ../postgresql-run-socket.patch

  ./configure --help

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --datadir=/usr/share/postgresql \
    --sysconfdir=/etc \
    --with-openssl \
    --with-system-tzdata=/usr/share/zoneinfo \
    --with-uuid=e2fs \
    --enable-nls \
    --enable-thread-safety \
    --with-llvm

  make world -j16
}

package_postgresql-src-libs() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0')
  provides=('postgresql-client' 'postgresql-libs')
  conflicts=('postgresql-client' 'postgresql-libs')

  cd "${srcdir}/postgresql-${pkgver}"

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/postgresql-libs/LICENSE"

  # install libs and non-server binaries
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done

  for util in pg_config pg_dump pg_dumpall pg_restore psql \
      clusterdb createdb createuser dropdb dropuser pg_isready reindexdb vacuumdb; do
    install -D -m644 doc/src/sgml/man1/${util}.1 "${pkgdir}"/usr/share/man/man1/${util}.1
  done

  cd src/include

  mkdir -p "${pkgdir}"/usr/include/{libpq,postgresql/internal/libpq}

  # these headers are needed by the public headers of the interfaces
  install -m644 pg_config.h "${pkgdir}/usr/include/"
  install -m644 pg_config_os.h "${pkgdir}/usr/include/"
  install -m644 pg_config_ext.h "${pkgdir}/usr/include/"
  install -m644 postgres_ext.h "${pkgdir}/usr/include/"
  install -m644 libpq/libpq-fs.h "${pkgdir}/usr/include/libpq/"
  install -m644 pg_config_manual.h "${pkgdir}/usr/include/"

  # these headers are needed by the not-so-public headers of the interfaces
  install -m644 c.h "${pkgdir}/usr/include/postgresql/internal/"
  install -m644 port.h "${pkgdir}/usr/include/postgresql/internal/"
  install -m644 postgres_fe.h "${pkgdir}/usr/include/postgresql/internal/"
  install -m644 libpq/pqcomm.h "${pkgdir}/usr/include/postgresql/internal/libpq/"
}

package_postgresql-src-docs() {
  pkgdesc="HTML documentation for PostgreSQL"
  options=('docs')
  provides=('postgresql-docs')
  conflicts=('postgresql-docs')

  cd "${srcdir}/postgresql-${pkgver}"

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/postgresql-docs/LICENSE"

#  make -C doc/src/sgml DESTDIR="${pkgdir}" install-html
#  chown -R root:root "${pkgdir}/usr/share/doc/postgresql/html/"

  # clean up
#  rmdir "${pkgdir}"/usr/share/man/man{1,3,7}
#  rmdir "${pkgdir}"/usr/share/man
}

package_postgresql-src() {
  pkgdesc="A sophisticated object-relational DBMS (from source, LTO enabled)"
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=("postgresql-src-libs>=${pkgver}" 'krb5' 'readline>=6.0' 'openssl>=1.0.0' 'pam' 'llvm' 'clang')
  optdepends=('python: for PL/Python support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade')
  options=('staticlibs')
  provides=('postgresql')
  conflicts=('postgresql')
  install=postgresql.install

  cd "${srcdir}/postgresql-${pkgver}"

  # install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install
  make -C doc/src/sgml DESTDIR="${pkgdir}" install-man

  # we don't want these, they are in the -libs package
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" uninstall
  done
  for util in pg_config pg_dump pg_dumpall pg_restore psql \
      clusterdb createdb createuser dropdb dropuser pg_isready reindexdb vacuumdb; do
    rm "${pkgdir}"/usr/share/man/man1/${util}.1
  done

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/postgresql/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/usr/share/doc/postgresql/html"

  install -D -m644 "${srcdir}/postgresql.service" \
    "${pkgdir}/usr/lib/systemd/system/postgresql.service"
  install -D -m755 "${srcdir}/postgresql-check-db-dir" \
    "${pkgdir}/usr/bin/postgresql-check-db-dir"

  install -D -m644 "${srcdir}/postgresql.pam" \
    "${pkgdir}/etc/pam.d/postgresql"

  install -D -m644 "${srcdir}/postgresql.logrotate" \
    "${pkgdir}/etc/logrotate.d/postgresql"
}
