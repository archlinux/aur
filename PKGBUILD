# exim-mysql based on exim from community
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=exim-mysql
pkgver=4.87
pkgrel=1
pkgdesc='Message Transfer Agent'
arch=('x86_64' 'i686')
url='http://www.exim.org/'
license=('GPL')
backup=(etc/mail/aliases etc/mail/exim.conf etc/logrotate.d/exim)
install=exim.install
depends=('gdbm' 'pcre' 'pam' 'openssl' 'libldap' 'libmysqlclient')
provides=('smtp-server' 'smtp-forwarder')
conflicts=('exim' 'smtp-server' 'smtp-forwarder')
options=('!makeflags')
source=(http://mirror.switch.ch/ftp/mirror/exim/exim/exim4/exim-$pkgver.tar.bz2
        aliases
        exim.logrotate
        exim.Makefile
        exim-submission@.service
        exim.service
        exim@.service
        exim.socket
        exim-submission.socket)

build() {
  cd exim-$pkgver

  cp ../exim.Makefile Local/Makefile
  make
}

package() {
  cd exim-$pkgver

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

sha512sums=('2b0d5c82133315c444e29abd182e0866482c904db1abe5ffe9a3008c2174f52eca850a433c069b4102874dc32bbe4af112beac94ffa154f1c06615c24deb47a4'
            '9cc0fe81b2110aecdd3d494650d051f773c2c83611692c4e5d365b89dcddd08b16af5b8f5f4ac3e3f553c36198846a05793d8fd01113f62d2ab761f555409201'
            'd8e3b466e0bba8175cfe762058dec49018495a260aa5efd139f4ef435284c305958cbd7fc514e81042146368b749ae38f0bf276fc0b4b91918ef33126900aa81'
            '72f15f2f59382be82b4e361dd780a39d8f263822d424c4ea252fa2568a090b44ae15263cc53b0df9369061f62738824d026646185c6f63ad09759e388b078c57'
            'dc28698f15e8eaa4614ae81fc8cb76d92fed1110ce02f7a6ee8feace418dbb194711eb2d4dd444cf818628c11721e21d80b7b974879ab6ddd78cc717cce17c2f'
            'e2fc3966c320460a26fbbf83e98df725587dc126dfe9d7a84c3285eb4b22a061b30499425c70f3d73cf13aa81c194274004efd20ce1316836463b982117909f8'
            '11c8133ee15b3e5193c9b1c59aed66c81b6e045dd23310bede9fcde6c88905db5ef08afdb798b53b75a7465915ea1247e980edf95db07a7f9b7bb58ce95fbb5a'
            'db621116907ceb573e6f34581f47c91f751bff593054d7ddc32397b34c7f2405bec184bdb0589d2ac457fa3a61bcba072761e3a6293a99c9c764d2d9fd6069ae'
            '4a233761793e3510e9efa5aad3a6098c41b757f13133a7ea825680f2b393aba8d7935f16bf1dd065dde884fe7ba45639a8d398333a7d9bf0a6b72f88c8f2a09d')
