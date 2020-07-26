# Maintainer: Andrey Korobkov <korobkov@fryxell.info> (ed25519/15CD12166CE1AA1E)
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=exim-gnutls
pkgver=4.94
pkgrel=1
pkgdesc='Message Transfer Agent (built with GnuTLS instead of OpenSSL)'
arch=('x86_64' 'i686')
url='https://www.exim.org/'
license=('GPL')
backup=('etc/mail/aliases' 'etc/mail/exim.conf' 'etc/logrotate.d/exim')
depends=('gdbm' 'libldap' 'libidn' 'libidn2' 'libnsl' 'libspf2' 'gnutls' 'pam' 'pcre' 'sqlite')
provides=('exim' 'smtp-server' 'smtp-forwarder')
conflicts=('exim' 'smtp-server' 'smtp-forwarder')
source=("https://ftp.exim.org/pub/exim/exim4/exim-$pkgver.tar.bz2"{,.asc}
        aliases
        exim.logrotate
        exim.Makefile
        exim-submission@.service
        exim.service
        exim@.service
        exim.socket
        exim-submission.socket
	exim.sysusers
	exim.tmpfiles)
sha512sums=('0ae405e8602a8a031d99ef87e663c80569d2aca0e633e6b6ea9ead0f273f955cdce014fec9620f4e1912818b8b1ec39c09f06b2de0730d467720b14e19f68465'
            'SKIP'
            'a91c6a9e5b3ac9d143741dba01e11616812ba44c3a8c768c8232364026460f0b8fdeeb120a2f2b86742a6e3ebbfc9d6335b86d108b044e43108b4a6f0374c9ad'
            'd8e3b466e0bba8175cfe762058dec49018495a260aa5efd139f4ef435284c305958cbd7fc514e81042146368b749ae38f0bf276fc0b4b91918ef33126900aa81'
            '18b04f4aa59b42ad43bcbbdad829ebca75c4d496b8ece2807fe5e8af70c0103deb2cf4953f3b546cdbf00d87154fc00a260444efd51096a1ab7729eb37a3f239'
            'dc28698f15e8eaa4614ae81fc8cb76d92fed1110ce02f7a6ee8feace418dbb194711eb2d4dd444cf818628c11721e21d80b7b974879ab6ddd78cc717cce17c2f'
            'b3c3b18652df435cb87d647cfd4f19e182fbf12b0b56f9c91f72b27ae5a819fb3d8c4c25445c5a3c184f70a0c181925fabda891f2057b8a917070d6c40529b8d'
            '11c8133ee15b3e5193c9b1c59aed66c81b6e045dd23310bede9fcde6c88905db5ef08afdb798b53b75a7465915ea1247e980edf95db07a7f9b7bb58ce95fbb5a'
            'db621116907ceb573e6f34581f47c91f751bff593054d7ddc32397b34c7f2405bec184bdb0589d2ac457fa3a61bcba072761e3a6293a99c9c764d2d9fd6069ae'
            '4a233761793e3510e9efa5aad3a6098c41b757f13133a7ea825680f2b393aba8d7935f16bf1dd065dde884fe7ba45639a8d398333a7d9bf0a6b72f88c8f2a09d'
            '87a16aa7bd60a8df0da8131bb811825232f25e934b9326460a2f8f0f8e0f44c53d71b1225ecfee8d30c8714f6e9f85f5f0821e346a7751d43683b406376d605b'
            'f8a34fea0a65d0992732bc444bbb334d060de7d91d9cca6f00bc950ba289afa813783517dd3999437f89bc194290785805df7081606a65abb1db3fd3b3aa94ca')

build() {
  cd exim-$pkgver

  cp ../exim.Makefile Local/Makefile
  make
}

package() {
  cd exim-$pkgver

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
