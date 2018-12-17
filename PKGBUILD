# Maintainer: Konrad Borowski <konrad@borowski.pw>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgbase=postgresql-10
pkgname=('postgresql-libs-10' 'postgresql-docs-10' 'postgresql-10')
pkgver=10.6
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc='Sophisticated object-relational DBMS'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'python' 'python2' 'perl' 'tcl>=8.6.0' 'openssl>=1.0.0' 'pam' 'zlib' 'icu' 'systemd' 'libldap')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
        postgresql-perl-rpath.patch
        postgresql.pam
        postgresql.logrotate
        postgresql.service
        postgresql-check-db-dir)
sha256sums=('68a8276f08bda8fbefe562faaf8831cb20664a7a1d3ffdbbcc5b83e08637624b'
            '8538619cb8bea51078b605ad64fe22abd6050373c7ae3ad6595178da52f6a7d9'
            '5f73b54ca6206bd2c469c507830261ebd167baca074698d8889d769c33f98a31'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            'ad025a5fb623b1a1e9dff0cc62cc63f66244bb27d81370a6251aa29e8574be94'
            '888a1d44f03fccfa4bf344ee45824fefb846ae3c1c0c40113ad6020b4be3b0cf')
sha512sums=('5d4d5cee2a19ad1820c3411bc4851904e3059cdcacc837350694d54d7d59260b66c565c72cc14a3a10541a8fc49c5185f08f57b7a8c7e4c64ed2614da6e1201f'
            '031efe12d18ce386989062327cdbbe611c5ef1f94e4e1bead502304cb3e2d410af533d3c7f1109d24f9da9708214fe32f9a10ba373a3ca8d507bdb521fbb75f7'
            '38302242b30c01c7981574ed28d9cbd9dc73bf6b56ba3a032afb5d0885ae83e5aa72ce578bf2422214dfa6c46f09d0bdd7cccaeb3c25d58754eb1a34f8bf5615'
            '1e6183ab0eb812b3ef687ac2c26ce78f7cb30540f606d20023669ac00ba04075487fb72e4dc89cc05dab0269ff6aca98fc1167cc75669c225b88b592482fbf67'
            '9ab4da01337ffbab8faec0e220aaa2a642dbfeccf7232ef2645bdc2177a953f17ee3cc14a4d8f8ebd064e1dae8b3dba6029adbffb8afaabea383963213941ba8'
            'acd60166ff513b16778705e824944945cd0a98abc519fa5f0232252e0e9c85460c6f8b85459d9692d1f3df1caaaf8909c3e7f785be99c2d3fb98a10b2641a795'
            '56974ef34a8d94596068413154b1a7ed5a71f5a3942bd79427f05e6f6b7853036874dedd8d988bb94306023f2a675996d500b075eaf8a192ef5c24026eb28eb0')

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../postgresql-perl-rpath.patch
}

build() {
  cd postgresql-${pkgver}
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
  cd postgresql-${pkgver}
  _postgres_check check
  _postgres_check check-world
}

package_postgresql-libs-10() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0' 'zlib' 'libldap')
  provides=('postgresql-client' "postgresql-libs=$pkgver")
  conflicts=('postgresql-client' 'postgresql-libs')

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

package_postgresql-docs-10() {
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

package_postgresql-10() {
  pkgdesc='Sophisticated object-relational DBMS'
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=("postgresql-libs>=${pkgver}" 'krb5' 'libxml2' 'readline>=6.0' 'openssl>=1.0.0' 'pam' 'icu' 'libsystemd' 'libldap')
  optdepends=('python2: for PL/Python 2 support'
              'python: for PL/Python 3 support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support')
  provides=("postgresql=$pkgver")
  conflicts=('postgresql')
  options=('staticlibs')
  install=postgresql.install

  cd postgresql-${pkgver}

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

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/postgresql/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/usr/share/doc/postgresql/html"

  install -Dm 644 "${srcdir}/postgresql.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 755 "${srcdir}/postgresql-check-db-dir" -t "${pkgdir}/usr/bin"

  install -Dm 644 "${srcdir}/postgresql.pam" "${pkgdir}/etc/pam.d/postgresql"
  install -Dm 644 "${srcdir}/postgresql.logrotate" "${pkgdir}/etc/logrotate.d/postgresql"

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
