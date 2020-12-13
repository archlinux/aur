# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Thomas Arnhold <thomas@arnhold.org
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Kuba Kuźma <kuba@jah.pl>
# Contributor: Matthew Carter <m@ahungry.com>
# Contributor: Ariel Popper <a@arielp.com>

pkgbase=postgresql-9.6
pkgname=(${pkgbase} ${pkgbase/-/-libs-} ${pkgbase/-/-docs-})
pkgver=9.6.20
pkgrel=1
pkgdesc="Sophisticated object-relational DBMS"
arch=("i686" "x86_64")
url="https://www.${pkgbase%-*}.org/"
license=("custom:PostgreSQL")
makedepends=("clang" "icu" "krb5" "libldap" "libxml2" "llvm" "openssl>=1.0.0" "pam" "perl" "python" "python2" "systemd" "tcl>=8.6.0" "zlib")
source=(
  "https://ftp.${pkgbase%-*}.org/pub/source/v${pkgver}/${pkgbase%-*}-${pkgver}.tar.bz2"
  "${pkgbase%-*}-perl-rpath.patch"
  "${pkgbase%-*}-run-socket.patch"
  "${pkgbase%-*}.pam"
  "${pkgbase%-*}.logrotate"
  "${pkgbase%-*}.service"
  "${pkgbase%-*}-check-db-dir"
  "${pkgbase%-*}.sysusers"
  "${pkgbase%-*}.tmpfiles"
)
sha256sums=(
  "3d08cba409d45ab62d42b24431a0d55e7537bcd1db2d979f5f2eefe34d487bb6"
  "77624f5efda79bd12d5ab59831883aad8e94395bc3ab933268b215d0b7b0df5f"
  "23ada3488c0d219f5957130b8231ab495b02467c30773082a9851ddc855cd705"
  "57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5"
  "6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e"
  "bd7ff909fd40f54058d3a7df426af6e02146b5cda97736687bee0862d7d93eaf"
  "40da687da4fb1f6b35f406dd0f48922065d8c905d678e2a27da05806f874b780"
  "7fa8f0ef3f9d40abd4749cc327c2f52478cb6dfb6e2405bd0279c95e9ff99f12"
  "4a4c0bb9ceb156cc47e9446d8393d1f72b4fe9ea1d39ba17213359df9211da57"
)

prepare() {
  cd "${srcdir}/${pkgbase%-*}-${pkgver}"

  patch -Np1 -i "${srcdir}/${pkgbase%-*}-run-socket.patch"
  patch -Np1 -i "${srcdir}/${pkgbase%-*}-perl-rpath.patch"
}

build() {
  cd "${srcdir}/${pkgbase%-*}-${pkgver}"

  local _options=(
    --prefix=/usr
    --mandir=/usr/share/man
    --datadir=/usr/share/${pkgbase%-*}
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

  # Regular build with everything
  ./configure ${_options[@]} PYTHON=/usr/bin/python2
  make world
}

package_postgresql-9.6() {
  pkgdesc="Sophisticated object-relational DBMS"
  depends=("${pkgbase%-*}-libs>=${pkgver}" "llvm-libs" "systemd-libs")
  optdepends=(
    "${pkgbase%-*}-old-upgrade: upgrade from previous major version using pg_upgrade"
    "perl: for PL/Perl support"
    "python2: for PL/Python 2 support"
    "python: for PL/Python 3 support"
    "tcl: for PL/Tcl support"
  )
  provides=("${pkgbase%-*}=${pkgver}")
  conflicts=("${pkgbase%-*}")
  backup=("etc/pam.d/${pkgbase%-*}" "etc/logrotate.d/${pkgbase%-*}")
  options=(staticlibs)
  install="${pkgbase%-*}.install"

  # Install
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}" DESTDIR="${pkgdir}" install
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/contrib" DESTDIR="${pkgdir}" install
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml" DESTDIR="${pkgdir}" install-man

  # We don't want these, they are in the -libs package
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/src/interfaces" DESTDIR="${pkgdir}" uninstall
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/src/bin/pg_config" DESTDIR="${pkgdir}" uninstall
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/src/bin/pg_dump" DESTDIR="${pkgdir}" uninstall
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/src/bin/psql" DESTDIR="${pkgdir}" uninstall
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/src/bin/scripts" DESTDIR="${pkgdir}" uninstall
  rm "${pkgdir}"/usr/share/man/man1/{pg_config,pg_dump,pg_dumpall,pg_restore,psql,clusterdb,createdb,createuser,dropdb,dropuser,pg_isready,reindexdb,vacuumdb}.1

  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  install -Dm755 "${srcdir}/${pkgbase%-*}-check-db-dir" "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${pkgbase%-*}.pam" "${pkgdir}/etc/pam.d/${pkgbase%-*}"
  install -Dm644 "${srcdir}/${pkgbase%-*}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgbase%-*}"
  install -Dm644 "${srcdir}/${pkgbase%-*}.service" "${pkgdir}/usr/lib/systemd/system/${pkgbase%-*}.service"
  install -Dm644 "${srcdir}/${pkgbase%-*}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgbase%-*}.conf"
  install -Dm644 "${srcdir}/${pkgbase%-*}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgbase%-*}.conf"

  # Clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/${pkgbase%-*}/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/usr/share/doc/${pkgbase%-*}/html"
}

package_postgresql-libs-9.6() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=("krb5" "zlib")
  provides=("${pkgbase%-*}-client" "${pkgname%-*}=$pkgver")
  conflicts=("${pkgbase%-*}-client" "${pkgname%-*}")

  # Install license
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

  # Install libs and non-server binaries
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/src/interfaces" DESTDIR="${pkgdir}" install
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/src/bin/pg_config" DESTDIR="${pkgdir}" install
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/src/bin/pg_dump" DESTDIR="${pkgdir}" install
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/src/bin/psql" DESTDIR="${pkgdir}" install
  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/src/bin/scripts" DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/clusterdb.1" "${pkgdir}/usr/share/man/man1/clusterdb.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/createdb.1" "${pkgdir}/usr/share/man/man1/createdb.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/createuser.1" "${pkgdir}/usr/share/man/man1/createuser.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/dropdb.1" "${pkgdir}/usr/share/man/man1/dropdb.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/dropuser.1" "${pkgdir}/usr/share/man/man1/dropuser.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/pg_config.1" "${pkgdir}/usr/share/man/man1/pg_config.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/pg_dump.1" "${pkgdir}/usr/share/man/man1/pg_dump.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/pg_dumpall.1" "${pkgdir}/usr/share/man/man1/pg_dumpall.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/pg_isready.1" "${pkgdir}/usr/share/man/man1/pg_isready.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/pg_restore.1" "${pkgdir}/usr/share/man/man1/pg_restore.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/psql.1" "${pkgdir}/usr/share/man/man1/psql.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/reindexdb.1" "${pkgdir}/usr/share/man/man1/reindexdb.1"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml/man1/vacuumdb.1" "${pkgdir}/usr/share/man/man1/vacuumdb.1"

  install -dm755 "${pkgdir}/usr/include/"{libpq,${pkgbase%-*}/internal/libpq}

  # These headers are needed by the public headers of the interfaces
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/src/include/pg_config.h" "${pkgdir}/usr/include"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/src/include/pg_config_os.h" "${pkgdir}/usr/include"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/src/include/pg_config_ext.h" "${pkgdir}/usr/include"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/src/include/postgres_ext.h" "${pkgdir}/usr/include"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/src/include/libpq/libpq-fs.h" "${pkgdir}/usr/include/libpq"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/src/include/pg_config_manual.h" "${pkgdir}/usr/include"

  # These headers are needed by the not-so-public headers of the interfaces
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/src/include/c.h" "${pkgdir}/usr/include/${pkgbase%-*}/internal"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/src/include/port.h" "${pkgdir}/usr/include/${pkgbase%-*}/internal"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/src/include/postgres_fe.h" "${pkgdir}/usr/include/${pkgbase%-*}/internal"
  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/src/include/libpq/pqcomm.h" "${pkgdir}/usr/include/${pkgbase%-*}/internal/libpq"
}

package_postgresql-docs-9.6() {
  pkgdesc="HTML documentation for PostgreSQL"
  arch=("any")
  provides=("${pkgname%-*}=${pkgver}")
  conflicts=("${pkgname%-*}")
  options=(docs)

  install -Dm644 "${srcdir}/${pkgbase%-*}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

  make -C "${srcdir}/${pkgbase%-*}-${pkgver}/doc/src/sgml" DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/usr/share/doc/${pkgbase%-*}/html"

  # Clean up
  rmdir "${pkgdir}/usr/share/man/man"{1,3,7}
  rmdir "${pkgdir}/usr/share/man"
}
