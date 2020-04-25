# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>
#
# Mainly using official postgresql PKGBUILD here
#

pkgbase=postgresql-git
pkgname=('postgresql-libs-git' 'postgresql-docs-git' 'postgresql-git')
pkgver=49068.d9a4cce29d
_majorver=${pkgver%.*}
pkgrel=3
pkgdesc='Sophisticated object-relational DBMS (Git version)'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'python' 'python2' 'perl' 'tcl>=8.6.0' 'openssl>=1.0.0'
             'pam' 'zlib' 'icu' 'systemd' 'libldap' 'llvm' 'clang')
source=(git://git.postgresql.org/git/postgresql.git
        postgresql-run-socket.patch
        postgresql-perl-rpath.patch
        postgresql.pam
        postgresql.logrotate
        postgresql.service
        postgresql-check-db-dir
        postgresql.sysusers
        postgresql.tmpfiles)
sha256sums=('SKIP'
            '719d24c09c5ea17701cbd49b77f40c58bde52b603c3c8b85a708d277175d27b8'
            '5bcc0bcedfa0271afaa05c35e7f651416a2a818c28069c51c2d0de0aa7d0dfdb'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            '25fb140b90345828dc01a4f286345757e700a47178bab03d217a7a5a79105b57'
            'bb24b8ce8c69935b7527ed54e10a8823068e31c8aa5b8ffea81ce6993264e8db'
            '7fa8f0ef3f9d40abd4749cc327c2f52478cb6dfb6e2405bd0279c95e9ff99f12'
            '4a4c0bb9ceb156cc47e9446d8393d1f72b4fe9ea1d39ba17213359df9211da57')
sha512sums=('SKIP'
            'caa2f44f00dff4ca8942a742c973f2d1b0ca4c7688c140858f61394aa74785dd5645c0301a04a1956c1e8a605487b640244497c845982f76bb0fea478e3b53f6'
            'b6b5407b79f414618c72a7bb2cf259f6b99abcc3a6d7f55b62bb6933662fdad6d1e6663a47108912ac99779a3f4d1e1907cc45219af7cc28850211475a7f3f3e'
            '1e6183ab0eb812b3ef687ac2c26ce78f7cb30540f606d20023669ac00ba04075487fb72e4dc89cc05dab0269ff6aca98fc1167cc75669c225b88b592482fbf67'
            '9ab4da01337ffbab8faec0e220aaa2a642dbfeccf7232ef2645bdc2177a953f17ee3cc14a4d8f8ebd064e1dae8b3dba6029adbffb8afaabea383963213941ba8'
            'ee0c010be07e8b5396cfd89c1d077b7c5573753d0210ea4e330e314c2759e25fbee9071e663f871855d65cc8ac75162af9e793dd10892f50f515e7a89cc8d6a0'
            'eaaccae8dabad67d2bc54f74ec8d3ddb46257369b90080a2860b65d500053db6ace608be4c1b6baaeab4a03245dcbb5215eb41e468acc2304c037f094c2e7819'
            '36f7a5d38370fdc4d4267fd5a8a8330f152a1077bf0f065b89d4a7b8112ccd42be2c46c863791b77de02013f28275a42219f4236e7cb837c3f8cfd5fcc7d3373'
            '5fe81d716d56d515ee4ae1aac56652b7bf20346ea8413482fd9fdb79f0485d8c5ed099f4d2cc460cbe37686488f1354dec433905ce005da8fec772e783addc70')

pkgver() {
    cd postgresql
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
  cd postgresql
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../postgresql-perl-rpath.patch
}

build() {
  cd postgresql
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

  # only build plpython3 for now
  ./configure ${options[@]} \
    PYTHON=/usr/bin/python
  make -C src/pl/plpython all
  make -C contrib/hstore_plpython all
  make -C contrib/ltree_plpython all

  # save plpython3 build and Makefile.global
  cp -a src/pl/plpython{,3}
  cp -a contrib/hstore_plpython{,3}
  cp -a contrib/ltree_plpython{,3}
  cp -a src/Makefile.global{,.python3}
  make distclean

  # regular build with everything
  ./configure ${options[@]} \
    PYTHON=/usr/bin/python2
  make world
}

_postgres_check() {
  make "${1}" || (find . -name regression.diffs | \
    while read -r line; do
      error "make ${1} failure: ${line}"
      cat "${line}"
    done; exit 1)
}

check() {
  cd postgresql
  _postgres_check check
  _postgres_check check-world
}

package_postgresql-libs-git() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0' 'zlib' 'libldap')
  provides=('postgresql-client')
  conflicts=('postgresql-client')

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

package_postgresql-docs-git() {
  pkgdesc="HTML documentation for PostgreSQL"
  options=('docs')

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
  depends=("postgresql-libs>=${pkgver}" 'krb5' 'libxml2' 'readline>=6.0' 'openssl>=1.0.0' 'pam' 'icu' 'systemd-libs' 'libldap' 'llvm-libs')
  optdepends=('python2: for PL/Python 2 support'
              'python: for PL/Python 3 support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade')
  options=('staticlibs')

  cd postgresql

  # install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install
  make -C doc/src/sgml DESTDIR="${pkgdir}" install-man

  # install plpython3
  mv src/Makefile.global src/Makefile.global.save
  cp src/Makefile.global.python3 src/Makefile.global
  touch -r src/Makefile.global.save src/Makefile.global
  make -C src/pl/plpython3 DESTDIR="${pkgdir}" install
  make -C contrib/hstore_plpython3 DESTDIR="${pkgdir}" install
  make -C contrib/ltree_plpython3 DESTDIR="${pkgdir}" install

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
