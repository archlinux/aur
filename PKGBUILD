# Maintainer: Marc Rechté <marc4@rechte.fr>

pkgbase=postgresql15
pkgver=15.5
_majorver=${pkgver%.*}
pkgname=("${pkgbase}-libs" "${pkgbase}-docs" "${pkgbase}")
pkgrel=5
pkgdesc='Sophisticated object-relational DBMS'
url='https://www.postgresql.org/'
arch=('x86_64')
provides=("postgresql")
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'python' 'tcl>=8.6.0' 'openssl>=1.0.0'
             'pam' 'zlib' 'icu' 'systemd' 'libldap' 'llvm' 'clang' 'libxslt')
optdepends=('perl: perl support requires recompile with --with-perl')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
        postgresql-perl-rpath.patch
        postgresql-xml.patch
        postgresql.service
        postgresql-check-db-dir
        postgresql.sysusers
        postgresql.tmpfiles
        pgenv.sh)
sha256sums=('8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6'
            '02ffb53b0a5049233f665c873b96264db77daab30e5a2194d038202d815a8e6a'
            'af6186d40128e043f333da4591455bf62b7c96e80214835f5c8c60b635ea9afb'
            '344a1ef322bccdbdec465ddd2d6752f453e6e349551fcf31d92b168d602da141'
            'fe19a0f68a9f10435fe09efbe7407de8cbe9bf16686d63524778e90dad67f863'
            '8426f2ad548fb00452b340a631ab070899c0d44e7a88c8c3eec087c75ce32e6e'
            '7fa8f0ef3f9d40abd4749cc327c2f52478cb6dfb6e2405bd0279c95e9ff99f12'
            'fddc68565151077b4f514345087c38ca069d049b8a17dbf7eef2826f49ccbc7b'
            '1ea08f0f7819c9ef965ef7851a2262ae6f4837242d7fde2b6a8098b969d1133e')

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../postgresql-perl-rpath.patch
  patch -p1 < ../postgresql-xml.patch
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

  # build
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

package_postgresql15-libs() {
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
  install -m 644 pg_config_ext.h "${pkgdir}/opt/${pkgbase}/include"
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
  install -m 755 pgenv.sh "${pkgdir}/opt/${pkgbase}/bin"
}

package_postgresql15-docs() {
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

package_postgresql15() {
  pkgdesc='Sophisticated object-relational DBMS'
  # backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=("${pkgbase}-libs>=${pkgver}" 'krb5' 'libxml2' 'readline>=6.0'
           'openssl>=1.0.0' 'pam' 'icu' 'systemd-libs' 'libldap' 'llvm-libs' 'libxslt')
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

  install -Dm 755 postgresql-check-db-dir -t "${pkgdir}/opt/${pkgbase}/bin"

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

# vim: ts=2 sw=2 et:
