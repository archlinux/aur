# Maintainer: Marc Rechté <marc4@rechte.fr>

pkgbase=postgresql18
pkgver=18.1
_majorver=${pkgver%.*}
pkgname=("${pkgbase}-libs" "${pkgbase}-docs" "${pkgbase}")
pkgrel=1
pkgdesc='Sophisticated object-relational DBMS'
url='https://www.postgresql.org/'
arch=('x86_64')
provides=("postgresql")
license=('custom:PostgreSQL')
depends=('bash' 'gcc-libs' 'glibc' 'icu' 'krb5' 'libldap' 'libxml2' 'libxslt' 'llvm-libs'
    'openssl' 'pam' 'readline' 'systemd-libs' 'util-linux-libs' 'lz4' 'zlib' 'zstd')
makedepends=('python' 'perl' 'tcl' 'systemd' 'llvm' 'clang' 'libxslt' 'docbook-xml' 'docbook-xsl')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql.service
        postgresql-check-db-dir
        postgresql.sysusers
        postgresql.tmpfiles
        pgenv.sh
        postgresql-run-socket.patch
        postgresql-perl-rpath.patch
        postgresql-doc.patch)
sha256sums=('ff86675c336c46e98ac991ebb306d1b67621ece1d06787beaade312c2c915d54'
            '1b10acff7b5f80ea39c6c122569cd461a12cf90114b777ad46d438447c5c5774'
            '3835a4a66a565d767868aef853aa56e13ba0367a42d82d96e4673f5ffe3eacc7'
            '7fa8f0ef3f9d40abd4749cc327c2f52478cb6dfb6e2405bd0279c95e9ff99f12'
            'fddc68565151077b4f514345087c38ca069d049b8a17dbf7eef2826f49ccbc7b'
            'a1e870e663bff17c597c49a432b858abb15048399b76653dc0a255b0228e29c6'
            '02ffb53b0a5049233f665c873b96264db77daab30e5a2194d038202d815a8e6a'
            'f579fe03f93418855f597e8f437fda7e3520e08296709c6c8d7102ab90f8451f'
            'f9a65fa4df6e20b744311e52396d5963dc2a2544929d84a3d58442d6ba90beaf')

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../postgresql-perl-rpath.patch
  # patch -p1 < ../postgresql-doc.patch
}

build() {
  cd postgresql-${pkgver}
  local options=(
    --prefix=/opt/${pkgbase}
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

  # Fix static libs (will not link if not set)
  CFLAGS+=" -ffat-lto-objects"
  # Add RUNPATH to locate libraries
  #LDFLAGS+=",-rpath,/opt/${pkgbase}/lib"
  LDFLAGS="-Wl,-rpath,/opt/${pkgbase}/lib"

  # build
  # see bug 17943, which requires llvm15/clang15 instead of current version 16: https://www.postgresql.org/message-id/17943-56bb8c6bd4409b9f%40postgresql.org
  # LLVM_CONFIG=llvm-config-15 CLANG=/usr/lib/llvm15/bin/clang \
  ./configure "${options[@]}"
  make world
}

_postgres_check() {
  LANG=C make "${1}" || (find . -name regression.diffs | \
    while read -r line; do
      echo "make ${1} failure: ${line}"
      cat "${line}"
    done; exit 1)
}

check() {
  cd postgresql-${pkgver}
  _postgres_check check
  _postgres_check check-world
}

package_postgresql18-libs() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0' 'zlib' 'libldap')
  provides=("${pkgbase}-client" 'libpq.so' 'libecpg.so' 'libecpg_compat.so' 'libpgtypes.so')
  conflicts=("${pkgbase}-client")

  pushd postgresql-${pkgver}

  # install license
  install -Dm 644 COPYRIGHT -t "${pkgdir}/opt/${pkgbase}/share/licenses/${pkgname}"

  

  # install libs and non-server binaries
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done

  for util in pg_config pg_dump pg_dumpall pg_restore psql \
      clusterdb createdb createuser dropdb dropuser pg_isready reindexdb vacuumdb; do
    install -Dm 644 doc/src/sgml/man1/${util}.1 "${pkgdir}"/opt/${pkgbase}/share/man/man1/${util}.1
  done

  cd src/include

  install -d "${pkgdir}"/opt/${pkgbase}/include/{libpq,postgresql/internal/libpq}

  # these headers are needed by the public headers of the interfaces
  install -m 644 pg_config.h "${pkgdir}/opt/${pkgbase}/include"
  install -m 644 pg_config_os.h "${pkgdir}/opt/${pkgbase}/include"
  #install -m 644 pg_config_ext.h "${pkgdir}/opt/${pkgbase}/include"
  install -m 644 postgres_ext.h "${pkgdir}/opt/${pkgbase}/include"
  install -m 644 libpq/libpq-fs.h "${pkgdir}/opt/${pkgbase}/include/libpq"
  install -m 644 pg_config_manual.h "${pkgdir}/opt/${pkgbase}/include"

  # these he aders are needed by the not-so-public headers of the interfaces
  install -m 644 c.h "${pkgdir}/opt/${pkgbase}/include/postgresql/internal"
  install -m 644 port.h "${pkgdir}/opt/${pkgbase}/include/postgresql/internal"
  install -m 644 postgres_fe.h "${pkgdir}/opt/${pkgbase}/include/postgresql/internal"
  install -m 644 libpq/pqcomm.h "${pkgdir}/opt/${pkgbase}/include/postgresql/internal/libpq"

  # this utility is to be sourced in order to find proper libs and bins
  popd
  sed -e "s/\$_majorver/$_majorver/" pgenv.sh >pgenv.sh.tmp
  install -m 755 pgenv.sh.tmp "${pkgdir}/opt/${pkgbase}/bin/pgenv.sh"
}

package_postgresql18-docs() {
  pkgdesc="HTML documentation for PostgreSQL"
  options=('docs')

  cd postgresql-${pkgver}

  install -Dm 644 COPYRIGHT -t "${pkgdir}/opt/${pkgbase}/share/licenses/${pkgname}"

  make -C doc/src/sgml DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/opt/${pkgbase}/share/doc/html"

  # clean up
  rmdir "${pkgdir}"/opt/${pkgbase}/share/man/man{1,3,7}
  rmdir "${pkgdir}"/opt/${pkgbase}/share/man
}

package_postgresql18() {
  pkgdesc='Sophisticated object-relational DBMS'
  # backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=("${pkgbase}-libs>=${pkgver}" 'krb5' 'libxml2' 'readline>=6.0'
           'openssl>=1.0.0' 'pam' 'icu' 'systemd-libs' 'libldap' 'llvm-libs' 'libxslt'
           'libxslt' 'lz4' 'zstd')
  optdepends=('python: for PL/Python 3 support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support')
  options=('staticlibs')
  install=postgresql.install

  pushd postgresql-${pkgver}

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
    rm "${pkgdir}"/opt/${pkgbase}/share/man/man1/${util}.1
  done

  install -Dm 644 COPYRIGHT -t "${pkgdir}/opt/${pkgbase}/share/licenses/${pkgname}"

  popd

  sed -e "s/\$_majorver/$_majorver/" postgresql-check-db-dir >postgresql-check-db-dir.tmp
  install -Dm 755 postgresql-check-db-dir.tmp "${pkgdir}/opt/${pkgbase}/bin/postgresql-check-db-dir"

  #install -Dm 644 postgresql.pam "${pkgdir}/etc/pam.d/${pkgname}"

  sed -e "s/\$pkgver/$pkgver/" -e "s/\$pkgbase/$pkgbase/" -e "s/\$_majorver/$_majorver/" postgresql.service >postgresql.service.tmp
  install -Dm 644 postgresql.service.tmp  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm 644 postgresql.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  sed -e "s/\$_majorver/$_majorver/" postgresql.tmpfiles >postgresql.tmpfiles.tmp
  install -Dm 644 postgresql.tmpfiles.tmp "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/opt/${pkgbase}/include/internal"
  rm -rf "${pkgdir}/opt/${pkgbase}/include/informix"
  rm -rf "${pkgdir}/opt/${pkgbase}/include/libpq"
  find "${pkgdir}//opt/${pkgbase}/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/opt/${pkgbase}/share/doc/html"
}

