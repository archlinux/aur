# $Id: PKGBUILD 184569 2016-07-28 18:51:26Z heftig $
# Maintainer: Sergey Shatunov <me#prok.pw>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_pkgname=exim
pkgbase=${_pkgname}-heavy
pkgname=(exim-heavy
         exim-lookup-dbmdb
         exim-lookup-dnsdb
         exim-lookup-dsearch
         exim-lookup-lsearch
         exim-lookup-mysql
         exim-lookup-passwd
         exim-lookup-pgsql
         exim-lookup-sqlite)
pkgname=exim-heavy
pkgver=4.90
pkgrel=1
pkgdesc='Message Transfer Agent with maximal-enabled features'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://www.exim.org/'
license=('GPL')
makedepends=('pcre' 'pam' 'openssl' 'libldap' 'libspf2' 'libidn' 'opendmarc' 'libsrs_alt' 'postgresql-libs' 'libmariadbclient' 'sqlite')
options=('!makeflags')
source=(ftp://ftp.exim.org/pub/exim/exim4/exim-$pkgver.tar.bz2
        aliases
        exim.logrotate
        exim.Makefile
        exim-submission@.service
        exim.service
        exim@.service
        exim.socket
        exim-submission.socket)
md5sums=('29a14c4bd29b553c0dfc13036225ebdd'
         '4874006f0585253ddab027d441009757'
         'e18a535218718c5eb394ed5c9296fe06'
         'd9c6c3b4c68313d5cdec7d63670f3e21'
         '88cf76405367a6ed371d05db1d3c9565'
         'be8fdcf7b2d6b6368a21705e69743265'
         '6f5a5c2b0835b33f59d2513cce18c65b'
         '101a726e4d3f4d0074710273f9808022'
         '11b319ba0bd84911fa70e9bef2190715')

build() {
  cd $_pkgname-$pkgver

  cp ../$_pkgname.Makefile Local/Makefile
  make
}

package_exim-heavy() {
  depends=('pcre' 'pam' 'openssl' 'libldap' 'libspf2' 'libidn' 'opendmarc' 'libsrs_alt')
  optdepends=('exim-lookup-dbmdb: for dbmdb lookup support'
              'exim-lookup-dnsdb: for dnsdb lookup support'
              'exim-lookup-dsearch: for dsearch lookup support'
              'exim-lookup-lsearch: for lsearch lookup support'
              'exim-lookup-mysql: for MariaDB/MySQL lookup support'
              'exim-lookup-passwd: for passwd lookup support'
              'exim-lookup-pgsql: for PostgreSQL lookup support'
              'exim-lookup-sqlite: for SQLite lookup support')
  provides=('smtp-server' 'smtp-forwarder')
  conflicts=('smtp-server' 'smtp-forwarder')
  backup=(etc/mail/aliases etc/mail/exim.conf etc/logrotate.d/exim)
  install=exim.install

  cd $_pkgname-$pkgver
  
  install -dm0755 "$pkgdir"/usr/lib/exim/lookups

  install -Dm0644 ../exim.logrotate "$pkgdir"/etc/logrotate.d/exim
  install -Dm0644 doc/exim.8 "$pkgdir"/usr/share/man/man8/exim.8

  mkdir -p "$pkgdir"/var/spool/exim/db "$pkgdir"/etc/mail \
    "$pkgdir"/var/log/exim "$pkgdir"/usr/{lib,bin}

  chmod 770 "$pkgdir"/var/spool/exim{,/db} "$pkgdir"/var/log/exim
  chown 0:79 "$pkgdir"/var/spool/exim "$pkgdir"/var/log/exim
  chown 79:79 "$pkgdir"/var/spool/exim/db

  cd build-Linux-*
  for i in exicyclog exim_checkaccess exim_dumpdb exim_lock exim_tidydb \
    exipick exiqsumm exigrep exim_dbmbuild exim exim_fixdb eximstats exinext \
    exiqgrep exiwhat; do
    install -m0755 "$i" "$pkgdir"/usr/bin
  done

  cd ../src
  sed -e "s|/etc/aliases|/etc/mail/aliases|g" \
    -e "s|SYSTEM_ALIASES_FILE|/etc/mail/aliases|g" \
    configure.default > "$pkgdir"/etc/mail/exim.conf

  cp "$srcdir"/aliases "$pkgdir"/etc/mail

  cd "$pkgdir"/usr/bin
  for i in mailq newaliases rmail rsmtp runq sendmail; do
    ln -s exim "$i"
  done

  # fhs compliancy
  ln -s ../bin/exim ../lib/sendmail

  install -Dm0644 "$srcdir"/exim-submission@.service \
    "$pkgdir"/usr/lib/systemd/system/exim-submission@.service
  install -Dm0644 "$srcdir"/exim.service \
    "$pkgdir"/usr/lib/systemd/system/exim.service
  install -Dm0644 "$srcdir"/exim@.service \
    "$pkgdir"/usr/lib/systemd/system/exim@.service
  install -Dm0644 "$srcdir"/exim.socket \
    "$pkgdir"/usr/lib/systemd/system/exim.socket
  install -Dm0644 "$srcdir"/exim-submission.socket \
    "$pkgdir"/usr/lib/systemd/system/exim-submission.socket
}

package_exim-lookup-dbmdb() {
  depends=(${pkgbase})
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/dbmdb.so "$pkgdir"/usr/lib/exim/lookups/dbmdb.so
}

package_exim-lookup-dnsdb() {
  depends=(${pkgbase})
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/dnsdb.so "$pkgdir"/usr/lib/exim/lookups/dnsdb.so
}

package_exim-lookup-dsearch() {
  depends=(${pkgbase})
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/dsearch.so "$pkgdir"/usr/lib/exim/lookups/dsearch.so
}

package_exim-lookup-lsearch() {
  depends=(${pkgbase})
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/lsearch.so "$pkgdir"/usr/lib/exim/lookups/lsearch.so
}

package_exim-lookup-mysql() {
  depends=(${pkgbase} 'libmariadbclient')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/mysql.so "$pkgdir"/usr/lib/exim/lookups/mysql.so
}

package_exim-lookup-passwd() {
  depends=(${pkgbase})
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/passwd.so "$pkgdir"/usr/lib/exim/lookups/passwd.so
}

package_exim-lookup-pgsql() {
  depends=(${pkgbase} 'postgresql-libs')
  replaces=('exim-pgsql')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/pgsql.so "$pkgdir"/usr/lib/exim/lookups/pgsql.so
}

package_exim-lookup-sqlite() {
  depends=(${pkgbase} 'sqlite')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/sqlite.so "$pkgdir"/usr/lib/exim/lookups/sqlite.so
}
