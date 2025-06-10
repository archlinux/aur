# Maintainer: a821 <a821 mail de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgbase=postgresql-git
pkgname=('postgresql-libs-git' 'postgresql-docs-git' 'postgresql-git')
pkgver=18.beta1.r132.gc37be39a74b
pkgrel=1
pkgdesc='Sophisticated object-relational DBMS (Git version)'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('PostgreSQL')
depends=(
  'bash'
  'gcc-libs'
  'glibc'
  'icu'
  'krb5'
  'libldap'
  'libxml2'
  'libxslt'
  'llvm-libs'
  'lz4'
  'openssl'
  'pam'
  'readline'
  'systemd-libs'
  'util-linux-libs'
  'zlib'
  'zstd'
)
makedepends=(
  'clang'
  'docbook-xml'
  'docbook-xsl'
  'git'
  'llvm'
  'perl'
  'perl-ipc-run'
  'python'
  'systemd'
  'tcl'
  'util-linux'
)
source=(git+https://git.postgresql.org/git/postgresql.git
        postgresql-run-socket.patch
        postgresql-perl-rpath.patch
        postgresql.pam
        postgresql.logrotate
        postgresql.service
        postgresql-check-db-dir
        postgresql.sysusers
        postgresql.tmpfiles)
sha512sums=('SKIP'
            '9f82c8e6982cc1ab4e5048c485a0c5a75fef32bf610bfeaccb8c4c28bb84ff0ebca8de83efc03044cf98275296babdcd9e12119f5320cedd899285e8a6f48b00'
            '7c38d6b468ad4502b741e72c8e5109c1ef8c561f52d2c4d96a030620659fd4b0e7e3d2438d31273318cef07a6f30f9134e18bb0419e324b40e62c35846b7b6e3'
            '1e6183ab0eb812b3ef687ac2c26ce78f7cb30540f606d20023669ac00ba04075487fb72e4dc89cc05dab0269ff6aca98fc1167cc75669c225b88b592482fbf67'
            '9ab4da01337ffbab8faec0e220aaa2a642dbfeccf7232ef2645bdc2177a953f17ee3cc14a4d8f8ebd064e1dae8b3dba6029adbffb8afaabea383963213941ba8'
            '751f245d213006451d744f1313b29cecd01132bbe0f5b69a7eb522c290db79664d6223422b1adcbcaa6bedfde8f1ca6f59a37ec3a5c53503fde2bcd9bbb900a0'
            '07ff44ce5d64b7d1e992a1829d44b00f8e04577b31686e9a4e9f32f249facc00b5415187e19f78dd3207b751adc852dc4fa2f4ab71f6de9167c28a131be60011'
            'c809e1d6307e0686f9e063adc582bcc0bba865f26610be4d8e65ee1b4ddc7908aab6696cd511ccbc54c3ba5963b4640a60e2e5d3e1859239cdb4f3fbaafd8cb2'
            '819faa16edb45a01500c3f5d307528648fffe6d22ba4734b8c1951a2a9491962188413f24e754c922830acef0635720ca355459b65142cd4acb29df08d9c222e')

pkgver() {
  cd postgresql
  git describe --tags | sed 's/REL_//;s/_/./;s/-/.r/;s/-/./g' | tr A-Z a-z
}

prepare() {
  cd postgresql
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../postgresql-perl-rpath.patch
}

build() {
  cd postgresql
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
    --disable-rpath
    --enable-nls
    --enable-tap-tests
    --enable-thread-safety
  )

  # Fix static libs
  CFLAGS+=" -ffat-lto-objects"

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
  export LANG=C LC_ALL=C
  cd postgresql
  _postgres_check check
  _postgres_check check-world
}

package_postgresql-libs-git() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=(
    'glibc'
    'krb5'
    'libldap'
    'lz4'
    'openssl'
    'readline'
    'zlib'
    'zstd'
  )
  provides=('postgresql-libs' 'libpq.so' 'libecpg.so' 'libecpg_compat.so' 'libpgtypes.so')
  conflicts=('postgresql-libs')

  cd postgresql

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
  install -m 644 postgres_ext.h "${pkgdir}/usr/include"
  install -m 644 libpq/libpq-fs.h "${pkgdir}/usr/include/libpq"
  install -m 644 pg_config_manual.h "${pkgdir}/usr/include"

  # these headers are needed by the not-so-public headers of the interfaces
  install -m 644 c.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 port.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 postgres_fe.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 libpq/pqcomm.h "${pkgdir}/usr/include/postgresql/internal/libpq"
}

package_postgresql-docs-git() {
  pkgdesc="HTML documentation for PostgreSQL"
  depends=()
  provides=('postgresql-docs')
  conflicts=('postgresql-docs')
  options+=('docs')

  cd postgresql

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  make -C doc/src/sgml DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/usr/share/doc/postgresql/html"

  # clean up
  rmdir "${pkgdir}"/usr/share/man/man{1,3,7}
  rmdir "${pkgdir}"/usr/share/man
}

package_postgresql-git() {
  pkgdesc='Sophisticated object-relational DBMS'
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends+=('postgresql-libs-git')
  optdepends=('python: for PL/Python 3 support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'logrotate: rotates system logs automatically')
  provides=('postgresql')
  conflicts=('postgresql')
  options+=('staticlibs')

  install=postgresql.install

  cd postgresql

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
