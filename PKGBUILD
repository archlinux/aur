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
pkgver=4.97.1
pkgrel=1
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
sha512sums=('eab7ca28b37f1635c48f5e963ab69fcbad539b2c35a84286ecaad7d7ff5210bbefce86452302e08099afdc0710f9cb7ca6d9b152b0ba88a19292f7c5541e0cfc'
            'SKIP'
            'a91c6a9e5b3ac9d143741dba01e11616812ba44c3a8c768c8232364026460f0b8fdeeb120a2f2b86742a6e3ebbfc9d6335b86d108b044e43108b4a6f0374c9ad'
            'd8e3b466e0bba8175cfe762058dec49018495a260aa5efd139f4ef435284c305958cbd7fc514e81042146368b749ae38f0bf276fc0b4b91918ef33126900aa81'
            '28db74cfd84b7870da9ef8feee54c7e3ca099e0904c450c041647f8e12999c18eb7be960f2464f9a01241486a8737e06fd5b70fa8eabe1fcd34550d460db7a1d'
            'ffc08d6ecf0a5b644febb6b8cd90000c8fe614dbfd94d3b387cf21b427608fac9aa0b6ab1b8b6eb74a4426d740a2eb9e2359124c6ef47b7175df9030a334d421'
            '726ae20403ede2d72081d88f3bcf5292868f9157ad2f37717698caf25182b449bed09fab941f81deaccfea7f6f33f2089ad70b0dcc24d56b3e31cc0701526ecd'
            '5f576b8a16995c52d501758c196634065f4416b9577d09ef1770ae3a470d79f7d795111370d5aeaf1516b80eba488cc75ce5962399078b38f0c84881b070fb6d'
            'c14fb960a6a4800e2883237734540822a74e9ba0459dd1c2c7e51d5407cfb87569b6c9c879c9ab9f78ce1414dc30f07d4321640d36829c0bcfb47991f5812a97'
            '4a233761793e3510e9efa5aad3a6098c41b757f13133a7ea825680f2b393aba8d7935f16bf1dd065dde884fe7ba45639a8d398333a7d9bf0a6b72f88c8f2a09d'
            '87a16aa7bd60a8df0da8131bb811825232f25e934b9326460a2f8f0f8e0f44c53d71b1225ecfee8d30c8714f6e9f85f5f0821e346a7751d43683b406376d605b'
            'f8a34fea0a65d0992732bc444bbb334d060de7d91d9cca6f00bc950ba289afa813783517dd3999437f89bc194290785805df7081606a65abb1db3fd3b3aa94ca')
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

# Local Variables:
# mode: sh
# indent-tabs-mode: nil
# End:
