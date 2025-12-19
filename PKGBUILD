# Maintainer: Nathaniel Clark <nathaniel.clark@misrule.us>
# Contributor: Sergey Shatunov <me#prok.pw>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_pkgname=exim
pkgbase=${_pkgname}-heavy
pkgname=(exim-heavy
         exim-lookup-mysql
         exim-lookup-passwd
         exim-lookup-pgsql)
pkgname=exim-heavy
pkgver=4.99.1
pkgrel=2
pkgdesc='Message Transfer Agent with maximal-enabled features'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.exim.org/'
license=('GPL')
depends=('gdbm' 'db5.3' 'libldap' 'libnsl' 'openssl' 'pam' 'pcre' 'sqlite' 'libspf2' 'libidn' 'libidn2' 'opendmarc>=1.4.0' 'perl-file-fcntllock')
makedepends=('postgresql-libs' 'libmariadbclient' 'perl-file-fcntllock')
source=("https://ftp.exim.org/pub/exim/exim4/exim-$pkgver.tar.xz"{,.asc}
        aliases
        exim.logrotate
        exim.Makefile
        exim.service
        exim@.service
        exim.socket
        exim-submission@.service
        exim-submission.socket
        exim.sysusers
        exim.tmpfiles)
sha256sums=('eae967bd49a5f879933b8c6ec88c30475a1c6646232135f37f05b55dbc4e3447'
            'SKIP'
            '932c9149b6809c70e94c1256e28325d197bbf80d27322793e217d4b692d49c5a'
            '7f1408f9c5d905968e665941f5c5efcf9da53e7a0bbef6c66220343bc2ae994b'
            'b61aabd7a0452afeae5e4583c0fba86eec00b497d8f7e1e0a5d48ef0044b2229'
            '6f5607d080e62c9c2fe430280e281338672f92769f1512786fb76a8f80afa579'
            '54329b044a6a1701197e8930cc5c1b7355b5e417a11d55486481bd7a3871017a'
            'cc46f41533ae7375bee63bc1bfa1281baf7f8f9f43e2f06187834e178c27d75f'
            '9419423cce11c5a654471298e70f25318acaf211274c2bec6f73e2ef52e68c82'
            'd3bb58f0fbeaaa33c812a823708664bbcd828da7d24e2a098f84a15aee443fee'
            '014b99ea2f1ba8044d8f03ac37bcbf4c7fbc592df522c75364e42c0e52fd8d59'
            'f26f3d363fcfcda0fb8236d9eb0325fc3b17f065f7991b16ca7e4187de1472cc')
validpgpkeys=('C693A034E1ED6EE954CAE2DA13DAD99C7E41519C'  # Phil Pennock <pdp@exim.org>
              'ACBB4324393ADE3515DA2DDA4D1E900E14C1CC04'  # Phil Pennock <phil.pennock@spodhuis.org>
              'E5CA331D44AB8E4C806FDBEE26101B62F69376CE'  # Heiko Schlittermann (Exim MTA Maintainer) <heiko@exim.org> (OLD)
              'D0BFD6B9ECA5694A6F149DCEAF4CC676A6B6C142'  # Heiko Schlittermann (Exim MTA Maintainer) <heiko@exim.org> (NEW)
              'A986F3A6BD6377D8730958DEBCE58C8CE41F32DF') # Jeremy Harris <jgh@wizmail.org>

prepare() {
  cd $_pkgname-$pkgver

  cp $srcdir/$_pkgname.Makefile Local/Makefile
}

build() {
  cd $_pkgname-$pkgver

  make
}

package_exim-heavy() {
  depends=('gdbm' 'libldap' 'libnsl' 'openssl' 'pam' 'pcre2' 'sqlite')
  optdepends=('exim-lookup-mysql: for MariaDB/MySQL lookup support'
              'exim-lookup-passwd: for passwd lookup support'
              'exim-lookup-pgsql: for PostgreSQL lookup support')
  provides=('smtp-server' 'smtp-forwarder')
  conflicts=('smtp-server' 'smtp-forwarder')
  backup=(etc/mail/aliases etc/mail/exim.conf etc/logrotate.d/exim)

  cd $_pkgname-$pkgver
  
  install -dm0755 "$pkgdir"/usr/lib/exim/lookups

  install -Dm0644 ../exim.logrotate "$pkgdir"/etc/logrotate.d/exim
  install -Dm0644 doc/exim.8 "$pkgdir"/usr/share/man/man8/exim.8

  install -Dm0644 ../exim.sysusers "$pkgdir"/usr/lib/sysusers.d/exim.conf
  install -Dm0644 ../exim.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/exim.conf

  cd build-Linux-*
  for i in exicyclog exim_checkaccess exim_dumpdb exim_lock exim_tidydb \
    exipick exiqsumm exigrep exim_dbmbuild exim exim_fixdb eximstats exinext \
    exiqgrep exiwhat; do
    install -Dm0755 "$i" "$pkgdir"/usr/bin/$i
  done
  chmod u+s "$pkgdir"/usr/bin/exim

  cd ../src
  sed -e "s|/etc/aliases|/etc/mail/aliases|g" \
    -e "s|SYSTEM_ALIASES_FILE|/etc/mail/aliases|g" \
    configure.default | install -Dm0644 /dev/stdin "$pkgdir"/etc/mail/exim.conf

  install -Dm0644 "$srcdir"/aliases "$pkgdir"/etc/mail/aliases

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

package_exim-lookup-mysql() {
  depends=(${pkgbase} 'libmariadbclient')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/mysql.so "$pkgdir"/usr/lib/exim/lookups/mysql_lookup.so
}

package_exim-lookup-passwd() {
  depends=(${pkgbase})
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/passwd.so "$pkgdir"/usr/lib/exim/lookups/passwd_lookup.so
}

package_exim-lookup-pgsql() {
  depends=(${pkgbase} 'postgresql-libs')
  replaces=('exim-pgsql')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build-Linux-*
  install -Dm0755 lookups/pgsql.so "$pkgdir"/usr/lib/exim/lookups/pgsql_lookup.so
}

# Local Variables:
# mode: sh
# indent-tabs-mode: nil
# End:
