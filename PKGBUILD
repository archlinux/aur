# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Tim Sharpe <tim@sharpe.id.au>
# Contributor: Matthew Carter <m@ahungry.com>

pkgbase=postgresql-9.4
pkgname=('postgresql-libs-9.4' 'postgresql-docs-9.4' 'postgresql-9.4')
pkgver=9.4.26
pkgrel=3
pkgdesc='Sophisticated object-relational DBMS'
url="https://www.postgresql.org/"
arch=('i686' 'x86_64')
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'python' 'python2' 'perl' 'tcl>=8.6.0' 'openssl>=1.0.0'
             'pam' 'zlib' 'icu' 'systemd' 'libldap' 'llvm' 'clang')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
	postgresql-perl-rpath.patch
        postgresql.pam
	postgresql.logrotate
        postgresql.service
	postgresql-check-db-dir
	postgresql.sysusers
	postgresql.tmpfiles)
sha256sums=('f5c014fc4a5c94e8cf11314cbadcade4d84213cfcc82081c9123e1b8847a20b9'
            '8538619cb8bea51078b605ad64fe22abd6050373c7ae3ad6595178da52f6a7d9'
            '5f73b54ca6206bd2c469c507830261ebd167baca074698d8889d769c33f98a31'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            'bd7ff909fd40f54058d3a7df426af6e02146b5cda97736687bee0862d7d93eaf'
            'f15418433b7d9a153eea22af58cc64fda462144d7039d1083ae1e2e489cc303a'
            '7fa8f0ef3f9d40abd4749cc327c2f52478cb6dfb6e2405bd0279c95e9ff99f12'
            '4a4c0bb9ceb156cc47e9446d8393d1f72b4fe9ea1d39ba17213359df9211da57')

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../postgresql-perl-rpath.patch
}

build() {
  cd "${srcdir}/postgresql-${pkgver}"

  local options=(
    --prefix=/usr
    --mandir=/usr/share/man
    --datadir=/usr/share/postgresql
    --sysconfdir=/etc
    --with-gssapi
    --with-libxml
    --with-openssl
    --with-perl
    --with-python
    --with-tcl
    --with-pam
    --with-system-tzdata=/usr/share/zoneinfo
    --with-uuid=e2fs
    --with-icu
    --with-systemd
    --with-ldap
    --with-llvm
    --enable-nls
    --enable-thread-safety
    --disable-rpath
  )

  # regular build with everything
  ./configure ${options[@]} \
    PYTHON=/usr/bin/python2
  make world
}

package_postgresql-libs-9.4() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0' 'zlib' 'libldap')
  provides=('postgresql-client' "postgresql-libs=$pkgver")
  conflicts=('postgresql-client' 'postgresql-libs')

  cd "${srcdir}/postgresql-${pkgver}"

  # install license
  install -D -m644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # install libs and non-server binaries
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done

  for util in pg_config pg_dump pg_dumpall pg_restore psql \
      clusterdb createdb createuser dropdb dropuser pg_isready reindexdb vacuumdb; do
    install -Dm 644 doc/src/sgml/man1/${util}.1 "${pkgdir}"/usr/share/man/man1/${util}.1
  done

  cd src/include

  install -d "${pkgdir}"/usr/include/{libpq,postgresql/internal/libpq}

  # these headers are needed by the public headers of the interfaces
  install -m 644 pg_config.h "${pkgdir}/usr/include"
  install -m 644 pg_config_os.h "${pkgdir}/usr/include"
  install -m 644 pg_config_ext.h "${pkgdir}/usr/include"
  install -m 644 postgres_ext.h "${pkgdir}/usr/include"
  install -m 644 libpq/libpq-fs.h "${pkgdir}/usr/include/libpq"
  install -m 644 pg_config_manual.h "${pkgdir}/usr/include"

  # these he aders are needed by the not-so-public headers of the interfaces
  install -m 644 c.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 port.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 postgres_fe.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 libpq/pqcomm.h "${pkgdir}/usr/include/postgresql/internal/libpq"
}

package_postgresql-docs-9.4() {
  pkgdesc="HTML documentation for PostgreSQL"
  options=('docs')
  provides=("postgresql-docs=$pkgver")
  conflicts=('postgresql-docs')

  cd postgresql-${pkgver}

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  make -C doc/src/sgml DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/usr/share/doc/postgresql/html"

  # clean up
  rmdir "${pkgdir}"/usr/share/man/man{1,3,7}
  rmdir "${pkgdir}"/usr/share/man
}

package_postgresql-9.4() {
  pkgdesc='Sophisticated object-relational DBMS'
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=("postgresql-libs>=${pkgver}" 'krb5' 'libxml2' 'readline>=6.0' 'openssl>=1.0.0' 'pam' 'icu' 'systemd-libs' 'libldap' 'llvm-libs')
  optdepends=('python2: for PL/Python 2 support'
              'python: for PL/Python 3 support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade')
  provides=("postgresql=$pkgver")
  conflicts=('postgresql')
  options=('staticlibs')
  install=postgresql.install

  cd postgresql-${pkgver}

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

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}"
  install -Dm 755 postgresql-check-db-dir -t "${pkgdir}/usr/bin"

  install -Dm 644 postgresql.pam "${pkgdir}/etc/pam.d/postgresql"
  install -Dm 644 postgresql.logrotate "${pkgdir}/etc/logrotate.d/postgresql"

  install -Dm 644 postgresql.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 postgresql.sysusers "${pkgdir}/usr/lib/sysusers.d/postgresql.conf"
  install -Dm 644 postgresql.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/postgresql.conf"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/postgresql/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/usr/share/doc/postgresql/html"
}

# vim: ts=2 sw=2 et:

