# Contributor: David Brown <d.brown at bigdavedev dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgbase=postgresql-11
pkgname=('postgresql-libs-11' 'postgresql-docs-11' 'postgresql-11')
pkgver=11.22
pkgrel=1
pkgdesc='[EOL] Sophisticated object-relational DBMS, version 11'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('custom:PostgreSQL')
makedepends=(
  'clang'
  'icu'
  'krb5'
  'libldap'
  'libxml2'
  'openssl'
  'pam'
  'python'
  'systemd'
  'tcl'
  'zlib'
)
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
        postgresql-check-db-dir
        postgresql.service
        postgresql.sysusers
        postgresql.tmpfiles
        postgresql.logrotate
        postgresql.pam
)
b2sums=('1bac5e9a73b1ad1f8e082cfe29f374058b866d3e1234612c01bcc4324e5e25a407531e71436a1c0e10e7574da494499540d242ac66db66d5f85c1ff5954bac41'
        '791fc4d09216276367904a06741a7a1f118346ad073146e38ea913f65c4c3cc2ef293af669494398352bba41789b43400389cda8ef699db146177b9a0f3cc1cb'
        '579be41e838a4b09495b7872e4484c7ff9545f2bb842696958f70919accdc9a7c5fbd03484e42d7ba0d83b13b460f9a63ef5c6d9a5a91e4e465e31db13c19741'
        'a4255df47b7ac1418d20aa73aa0f6e70c7952a10d706e5523043c48b2c3b6d8e39838049dfcc826913cd0f2c06502561d1abe8b19cce7071db66139ae93a37bf'
        '5e9cba2f45604db83eb77c7bbb54bc499a38274be6cd97abb056c9bdf18e637a8ac354e18f41f614f7e1a2d6f13c2a0b562ab0aaebf9447cf5eb2d60e6501e12'
        '8a8e5ec24ea338b2b51b8d2be5a336ac8d4cc6b25200ed0f0d564df9942997478df0c54da2fac7b27d677774a34398f69047eecd0f97bdc0df8fe50a1b5ed74d'
        '2209b7550acad7955102ec6922754b4046b2a2ad2a7e1cfb2cc4053c0705abac7aa7d7968eab617f50894797d06345f51c9a669926bd2a77dcf688206a2027e0'
        '3eab84d332d96678fe6e435ee243c8f1a82b838f601d61d3604d11e918aed7a62202edca5e476c4b9031ed284570e6fcd6c659cfdbd9624aa0019d3233755f81')

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../postgresql-run-socket.patch
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
    --without-perl
    --with-python
    --with-tcl
    --with-pam
    --with-system-tzdata=/usr/share/zoneinfo
    --with-uuid=e2fs
    --with-icu
    --with-systemd
    --with-ldap
    --without-llvm
    --enable-nls
    --enable-thread-safety
    --disable-rpath
  )

  ./configure ${options[@]}
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

package_postgresql-libs-11() {
  pkgdesc="[EOL] Libraries for use with PostgreSQL, version 11"
  depends=(
    'glibc'
    'krb5'
    'libldap'
    'openssl'
    'readline'
    'zlib'
  )
  provides=(
    "postgresql-client=$pkgver"
    "postgresql-libs=$pkgver"
    'libecpg.so'
    'libecpg_compat.so'
    'libpgtypes.so'
    'libpq.so'
  )
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

package_postgresql-docs-11() {
  pkgdesc="[EOL] HTML documentation for PostgreSQL, version 11"
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

package_postgresql-11() {
  pkgdesc='[EOL] Sophisticated object-relational DBMS, version 11'
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=(
    "postgresql-libs>=${pkgver}"
    'glibc'
    'icu'
    'krb5'
    'libldap'
    'libxml2'
    'openssl'
    'pam'
    'sh'
    'systemd-libs'
    'util-linux-libs'
    'zlib'
  )
  optdepends=('python: for PL/Python 3 support'
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
