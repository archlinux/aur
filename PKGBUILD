# Maintainer: gwhite <gwhite@kupulau.com>

pkgbase=postgresql-src-beta
pkgname=('postgresql-src-libs' 'postgresql-src-docs' 'postgresql-src')
pkgver=11beta4
_majorver=11.0
pkgrel=6
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
        postgresql.pam postgresql.logrotate
        postgresql.service 
        postgresql-check-db-dir)
sha256sums=('bb0b21f7f551cf5b3e13c05fdf8266fd0ce14db1f62e9c8d21b395ddbaf68fe4'
            '8538619cb8bea51078b605ad64fe22abd6050373c7ae3ad6595178da52f6a7d9'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            'b48fe97f8e43ed0d2041d519119a4dafb70fcae72870951bf4fb7350fe169ac8'
            '7912aa25937cba9e971c071625e5117638509fe2cf4232e071d18fc53b585500')

build() {
  cd "${srcdir}/postgresql-${pkgver}"

  patch -Np1 < ../postgresql-run-socket.patch

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --datadir=/usr/share/postgresql \
    --sysconfdir=/etc \
    --with-openssl \
    --with-system-tzdata=/usr/share/zoneinfo \
    --with-uuid=e2fs \
    --enable-nls \
    --with-llvm \
    --enable-thread-safety

  make world -j8
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
