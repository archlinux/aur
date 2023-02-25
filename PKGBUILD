# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>
# Maintainer: Ariel Popper <a@arielp.com>

pkgbase=postgresql-lts
pkgname=('postgresql-lts-libs' 'postgresql-lts-docs' 'postgresql-lts')
pkgver=11.19
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc='Sophisticated object-relational DBMS'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'python' 'perl' 'tcl>=8.6.0' 'openssl>=1.0.0'
             'pam' 'zlib' 'icu' 'systemd' 'libldap' 'llvm' 'clang')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
        postgresql-perl-rpath.patch
        postgresql-lts.pam
        postgresql-lts.logrotate
        postgresql-lts.service
        postgresql-check-db-dir
        postgresql-lts.sysusers
        postgresql-lts.tmpfiles)
sha256sums=('13109e2b71f1139405c27201da3733a61ace72ee1c228d9c9f0320e06aee14c2'
            '8538619cb8bea51078b605ad64fe22abd6050373c7ae3ad6595178da52f6a7d9'
            'fa7cc63936bce336fedf8ce8d11c8a0e051d6424a10570b991164386e96058cb'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            '25fb140b90345828dc01a4f286345757e700a47178bab03d217a7a5a79105b57'
            '2bbd8c4e51b70223d274fef3a167af096f44af3d3c41ae505ad11c606674e7c5'
            '7fa8f0ef3f9d40abd4749cc327c2f52478cb6dfb6e2405bd0279c95e9ff99f12'
            '4a4c0bb9ceb156cc47e9446d8393d1f72b4fe9ea1d39ba17213359df9211da57')

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../postgresql-perl-rpath.patch
}

build() {
  cd postgresql-${pkgver}
  local configure_options=(
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
    --with-readline
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

  # Fix static libs
  CFLAGS+=" -ffat-lto-objects"

  # only build plpython3 for now
  ./configure ${configure_options[@]} \
    PYTHON=/usr/bin/python
  make -sC src/pl/plpython all
  make -sC contrib/hstore_plpython all
  make -sC contrib/ltree_plpython all

  # save plpython3 build and Makefile.global
  cp -a src/pl/plpython{,3}
  cp -a contrib/hstore_plpython{,3}
  cp -a contrib/ltree_plpython{,3}
  cp -a src/Makefile.global{,.python3}
  make -s distclean

  # regular build with everything
  ./configure ${configure_options[@]} \
    PYTHON=/usr/bin/python3
  make -s world
}

_postgres_check() {
  make -s "${1}" || (find . -name regression.diffs | \
    while read -r line; do
      error "make ${1} failure: ${line}"
      cat "${line}"
    done; exit 1)
}

check() {
  cd postgresql-${pkgver}
  _postgres_check check
  _postgres_check check-world
}

package_postgresql-lts-libs() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0' 'zlib' 'libldap')
  provides=('postgresql-client' "postgresql-libs=$_majorver")
  conflicts=('postgresql-client' 'postgresql-libs')

  cd postgresql-${pkgver}

  # install license
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # install libs and non-server binaries
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -sC ${dir} DESTDIR="${pkgdir}" install
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

package_postgresql-lts-docs() {
  pkgdesc="HTML documentation for PostgreSQL"
  provides=("postgresql-docs=${_majorver}")
  conflicts=('postgresql-docs')
  options+=('docs')

  cd postgresql-${pkgver}

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  make -sC doc/src/sgml DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/usr/share/doc/postgresql/html"

  # clean up
  rmdir "${pkgdir}"/usr/share/man/man{1,3,7}
  rmdir "${pkgdir}"/usr/share/man
}

package_postgresql-lts() {
  pkgdesc='Sophisticated object-relational DBMS'
  backup=("etc/pam.d/${pkgname}" "etc/logrotate.d/${pkgname}")
  provides=("postgresql=$_majorver")
  conflicts=("postgresql")
  depends=("postgresql-lts-libs>=${pkgver}" 'krb5' 'libxml2' 'readline>=6.0' 'openssl>=1.0.0' 'pam' 'icu' 'systemd-libs' 'libldap')
  optdepends=('python: for PL/Python 3 support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'llvm: for JIT compilation support'
              'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade')
  options+=('staticlibs')

  cd postgresql-${pkgver}

  # install
  make -s DESTDIR="${pkgdir}" install
  make -sC contrib DESTDIR="${pkgdir}" install
  make -sC doc/src/sgml DESTDIR="${pkgdir}" install-man

  # install plpython3
  mv src/Makefile.global src/Makefile.global.save
  cp src/Makefile.global.python3 src/Makefile.global
  touch -r src/Makefile.global.save src/Makefile.global
  make -sC src/pl/plpython3 DESTDIR="${pkgdir}" install
  make -sC contrib/hstore_plpython3 DESTDIR="${pkgdir}" install
  make -sC contrib/ltree_plpython3 DESTDIR="${pkgdir}" install

  # we don't want these, they are in the -libs package
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -sC ${dir} DESTDIR="${pkgdir}" uninstall
  done
  for util in pg_config pg_dump pg_dumpall pg_restore psql \
      clusterdb createdb createuser dropdb dropuser pg_isready reindexdb vacuumdb; do
    rm "${pkgdir}"/usr/share/man/man1/${util}.1
  done

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}"
  install -Dm 755 postgresql-check-db-dir -t "${pkgdir}/usr/bin"

  install -Dm 644 ${pkgname}.pam "${pkgdir}/etc/pam.d/${pkgname}"
  install -Dm 644 ${pkgname}.logrotate "${pkgdir}/etc/logrotate.d/${pkgname}"

  install -Dm 644 ${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/postgresql/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/usr/share/doc/postgresql/html"
}

# vim: ts=2 sw=2 et:
