# Maintainer: a821
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Artjom Simon <artjom.simon@gmail.com>
# Contributor: Wèi Cōngruì <crvv.pku@gmail.com>

pkgbase=postgresql-beta
pkgname=('postgresql-beta-libs' 'postgresql-beta-docs' 'postgresql-beta')
pkgver=16rc1
pkgrel=1
pkgdesc='Sophisticated object-relational DBMS'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'python' 'perl' 'tcl' 'openssl'
             'pam' 'zlib' 'icu' 'systemd' 'libldap' 'llvm15' 'clang15' 'libxslt'
             'util-linux')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
        postgresql-perl-rpath.patch
        postgresql.pam
        postgresql.logrotate
        postgresql.service
        postgresql-check-db-dir
        postgresql.sysusers
        postgresql.tmpfiles)
sha256sums=('ce97b3f4199a702a19ced11f86d0b93bb1fa55e869129e1435210ed8d505fa84'
            'ce71d9334ce9eb59b967ed4fb8647bebdf49cc4d18b191b4c107241cdf92237d'
            '631086b437e256aaf6fa16b26f6100af4f5de6ece2580b41d343f2ccaa5038d6'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            '25fb140b90345828dc01a4f286345757e700a47178bab03d217a7a5a79105b57'
            'a768b6c8093fef56349fa61e56fae093cb962376fb0d8d0d4c98bf5fe53d29ed'
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
    --with-libxslt
    --with-lz4
    --with-zstd
    --enable-nls
    --enable-thread-safety
    --disable-rpath
  )

  # Fix static libs
  CFLAGS+=" -ffat-lto-objects"

  # regular build with everything
  LLVM_CONFIG=llvm-config-15 CLANG=/usr/lib/llvm15/bin/clang \
  ./configure "${configure_options[@]}"
  make world
}

_postgres_check() {
  make "${1}" || (find . -name regression.diffs | \
    while read -r line; do
      echo "make ${1} failure: ${line}"
      cat "${line}"
    done; exit 1)
}

check() {
  export LANG=C
  cd postgresql-${pkgver}
  _postgres_check check
  _postgres_check check-world
}

package_postgresql-beta-libs() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl' 'readline' 'zlib' 'libldap')
  provides=('postgresql-libs' 'libpq.so' 'libecpg.so' 'libecpg_compat.so' 'libpgtypes.so')
  conflicts=('postgresql-libs')

  cd postgresql-${pkgver}

  # install license
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

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

package_postgresql-beta-docs() {
  pkgdesc="HTML documentation for PostgreSQL"
  provides=('postgresql-docs')
  conflicts=('postgresql-docs')
  options+=('docs')

  cd postgresql-${pkgver}

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  make -C doc/src/sgml DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/usr/share/doc/postgresql/html"

  # clean up
  rmdir "${pkgdir}"/usr/share/man/man{1,3,7}
  rmdir "${pkgdir}"/usr/share/man
}

package_postgresql-beta() {
  pkgdesc='Sophisticated object-relational DBMS'
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=("postgresql-beta-libs" 'krb5' 'libxml2' 'readline'
           'openssl' 'pam' 'icu' 'systemd-libs' 'libldap' 'llvm15-libs'
           'libxslt' 'lz4' 'zstd')
  optdepends=('python: for PL/Python 3 support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade'
              'logrotate: rotates system logs automatically')
  provides=('postgresql')
  conflicts=('postgresql')
  options+=('staticlibs')
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
