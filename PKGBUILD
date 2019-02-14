# Maintainer: Ariel Popper <a@arielp.com>

pkgbase=postgresql-lts
pkgname=('postgresql-lts-libs' 'postgresql-lts-docs' 'postgresql-lts')
pkgver=9.4.21
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc="A sophisticated object-relational DBMS"
arch=('i686' 'x86_64')
url="http://www.postgresql.org/"
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'python2' 'perl' 'tcl>=8.6.0'
             'openssl>=1.0.0' 'pam')
source=(http://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch postgresql.pam postgresql.logrotate
        postgresql.service postgresql.tmpfiles.conf
        postgresql-check-db-dir)
sha256sums=('0049b4d239a00654e792997aff32a0be7a6bdd922b5ca97f1a06797cd4d06006'
            '8538619cb8bea51078b605ad64fe22abd6050373c7ae3ad6595178da52f6a7d9'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            '456c331d10b987c2bb7b4a9b42192ffae5b6b2c72829d16b20f39c5897b79d62'
            '7e086d70e0dcaa6ce45693b4e826ce92d770192b3aff5642319b1ef279d88dc4'
            'f15418433b7d9a153eea22af58cc64fda462144d7039d1083ae1e2e489cc303a')

build() {
  cd "${srcdir}/postgresql-${pkgver}"

  patch -Np1 < ../postgresql-run-socket.patch

  ./configure \
    --prefix=/usr --mandir=/usr/share/man \
    --datadir=/usr/share/postgresql --sysconfdir=/etc --with-gssapi \
    --with-libxml --with-openssl --with-perl \
    --with-python PYTHON=/usr/bin/python2 \
    --with-tcl --with-pam --with-system-tzdata=/usr/share/zoneinfo \
    --with-uuid=e2fs --enable-nls --enable-thread-safety

  make world
}

package_postgresql-lts-libs() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0')
  provides=('postgresql-client' "postgresql-libs=$_majorver")
  conflicts=('postgresql-client' 'postgresql-libs')

  cd "${srcdir}/postgresql-${pkgver}"

  # install license
  install -D -m644 COPYRIGHT \
    "${pkgdir}/usr/share/licenses/${pkgbase}-libs/LICENSE"

  # install libs and non-server binaries
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump \
             src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done

  for util in pg_config pg_dump pg_dumpall pg_restore psql clusterdb \
              createdb createlang createuser dropdb droplang dropuser \
              pg_isready reindexdb vacuumdb; do
    install -D -m644 doc/src/sgml/man1/${util}.1 \
      "${pkgdir}"/usr/share/man/man1/${util}.1
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

package_postgresql-lts-docs() {
  pkgdesc="HTML documentation for PostgreSQL"
  arch=('any')
  provides=("postgresql-docs=${_majorver}")
  conflicts=('postgresql-docs')
  options=('docs')

  cd "${srcdir}/postgresql-${pkgver}"

  # install license
  install -D -m644 COPYRIGHT \
    "${pkgdir}/usr/share/licenses/${pkgbase}-docs/LICENSE"

  make -C doc/src/sgml DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/usr/share/doc/postgresql/html/"

  # clean up
  rmdir "${pkgdir}"/usr/share/man/man{1,3,7}
  rmdir "${pkgdir}"/usr/share/man
}

package_postgresql-lts() {
  #pkgdesc=""  ##Set at top so namcap will just shut the hell up already!
  provides=("postgresql=$_majorver")
  conflicts=("postgresql")
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=("postgresql-lts-libs>=${pkgver}" 'krb5' 'libxml2' \
           'readline>=6.0' 'openssl>=1.0.0' 'pam')
  optdepends=('python2: for PL/Python support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'postgresql-lts-old-upgrade: upgrade from previous major version using pg_upgrade')
  options=('staticlibs')
  install=postgresql.install

  cd "${srcdir}/postgresql-${pkgver}"

  # install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install
  make -C doc/src/sgml DESTDIR="${pkgdir}" install-man

  # we don't want these, they are in the -libs package
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump \
             src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" uninstall
  done
  for util in pg_config pg_dump pg_dumpall pg_restore psql clusterdb \
              createdb createlang createuser dropdb droplang dropuser \
              pg_isready reindexdb vacuumdb; do
    rm "${pkgdir}"/usr/share/man/man1/${util}.1
  done

  # install license
  install -D -m644 COPYRIGHT \
    "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/postgresql/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/usr/share/doc/postgresql/html"

  install -D -m644 "${srcdir}/postgresql.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/postgresql.conf"
  install -D -m644 "${srcdir}/postgresql.service" \
    "${pkgdir}/usr/lib/systemd/system/postgresql.service"
  install -D -m755 "${srcdir}/postgresql-check-db-dir" \
    "${pkgdir}/usr/bin/postgresql-check-db-dir"

  install -D -m644 "${srcdir}/postgresql.pam" \
    "${pkgdir}/etc/pam.d/postgresql"

  install -D -m644 "${srcdir}/postgresql.logrotate" \
    "${pkgdir}/etc/logrotate.d/postgresql"
}


