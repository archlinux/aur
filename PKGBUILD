# Maintainer: Sébastien Luttringer
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=mailman
pkgver=2.1.39
pkgrel=2
pkgdesc='The GNU Mailing List Manager'
arch=(x86_64)
license=('GPL')
url='https://www.list.org/'
# we need to have the mailman user to build mailman
makedepends=('mailman')
depends=('glibc' 'python2' 'smtp-server' 'python2-dnspython' 'systemd')
# 'Defaults.py' should not be changed by users; 'mm_cfg.py' should instead.
backup=('usr/lib/mailman/Mailman/mm_cfg.py')
install=$pkgname.install
source=("https://launchpad.net/mailman/2.1/$pkgver/+download/mailman-$pkgver.tgz"{,.asc}
        'mailman.profile.sh'
        'mailman.profile.csh'
        'mailman.sysusers'
        'mailman.service'
        'mailman-checkdbs.service'
        'mailman-checkdbs.timer'
        'mailman-cullbadshunt.service'
        'mailman-cullbadshunt.timer'
        'mailman-disabled.service'
        'mailman-disabled.timer'
        'mailman-gatenews.service'
        'mailman-gatenews.timer'
        'mailman-mailpasswds.service'
        'mailman-mailpasswds.timer'
        'mailman-nightlygzip.service'
        'mailman-nightlygzip.timer'
        'mailman-senddigests.service'
        'mailman-senddigests.timer'
        '01-mailman-2.1-build.patch'
        '02-fix-500-error-for-non-member.patch'
        )
validpgpkeys=('C638CAEF0AC21563736B5A22555B975E953B8693') # Mark Sapiro <mark@msapiro.net>
sha256sums=('7b8e9222364abdfd25cb2053c422319aac7b620c287dd979703e0399d72f4390'
            'SKIP'
            '1af0e72434c6dbaada49df3b2b7de03ec4574f7534ce5545b4de26372241d9f4'
            '058d35874967ccd8b9a92fa40480c1350f4ef5ad2fa783e4baf1b0309f6782cb'
            '3e10268d5dfa64699efa247ef0082a6ec5f1dea401fa4d05c030994c6a115348'
            '7c0ae496ba6df36bf53ad4f23d5a7954b472645ed51decadda03f47458c03674'
            '4e59a77b6d000b19909c0e7fdd46e265f75b5d97c2fdc4574ece22541845af6e'
            'b08b0617e3039248c8ae7a222dcd0d8097154746d6fc0c6b51cd36e1f6b0f4d8'
            '58bfa5dc0fc3132f0300e2cb612d58c0b9f8d2c0972c71cb903bc252c155992e'
            'f49fdecdeb4353ea8b980a93031a5a9ba8b528f7fbcd1e5277c80e5eaaa25c89'
            'c100a159168261937a3fea9e715fe2c55c2bdec60d4891c1bfef6edbaf7ea6bf'
            '8794f8e3a448f980a231e00024e3e579d1ee02020ce94ae3e5e29abbfd8fb043'
            'f84f61cd87d8c584e1a5ad010f28b764c09ee034296d24b468b05695edbd6a38'
            'd07d9373447a53da9c7cec3722b3defd27ff52b609eb9b78c72f48452773fa0f'
            'ceb61fb03ea3cdc307985b6885dd516c7921f0408037a5a4ba8e76ad64d5b940'
            '20015b4d292a19deaeabb49cc1b55d6712453a26f1118d7561eea472da52e60f'
            '37cc29eb737700cd14be4cc5c442ebfeb50dfedcc3b0149dc7d9edbcb3558307'
            '4e22a0fec29e6e13d3bcf91a3e89e943aa4a67026f1b818438744cb9925d017e'
            '1c01dc43807366e2cdd9f95bb6ae257641f45946a7b33753692de68bba0c1b11'
            '274ec372975a8092ad2d743668b3a2c73e027ebe46d9f51098edeef6e712eaef'
            '50f14274db4eb34a172cb0658903189ed0b7c77b3c0ecdd59e9a11f770051561'
            'aa01f95e6c79cc3c2b82922ee80a7434cfd2f79ad2e1c946df97539460e18b5d')

prepare() {
  cd $pkgname-$pkgver

  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      echo "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done

  # some files in mailman doesn't use configure parameter
  echo 'Fix python2 sheebang'
  find . -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --without-permcheck \
    --prefix=/usr/lib/mailman \
    --with-var-prefix=/var/lib/mailman \
    --with-mail-gid=mailman \
    --with-username=mailman \
    --with-groupname=mailman \
    --with-cgi-gid=http \
    --with-python=/usr/bin/python2 \
    --with-mailhost=localhost \
    --with-urlhost=localhost
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # let's follow Fedora FHS way; Gentoo does it the other way round

  # Create a link so that the config file mm_cfg.py appears in config
  # directory /etc/mailman. We don't put mm_cfg.py in the config directory
  # because its executable code (python file) and the security policy wants
  # to keep executable code out of /etc and inside of a lib directory instead,
  # and because traditionally mm_cfg.py was in the Mailman subdirectory and
  # experienced mailman admins will expect to find it there. But having it
  # "appear" in the config directory is good practice and heading in the
  # right direction for FHS compliance.
  install -d -m755 "$pkgdir/etc/$pkgname"
  ln -sv /usr/lib/mailman/Mailman/mm_cfg.py "$pkgdir/etc/$pkgname/mm_cfg.py"
  # fix some permissions to satisfy check_perms
  chown -R mailman:mailman "$pkgdir"/{usr/lib/mailman,var/lib/mailman,etc/mailman/*}
  chown http:mailman "$pkgdir"/var/lib/mailman/archives/private
  chmod 2770 "$pkgdir"/var/lib/mailman/archives/private
  chmod 2755 "$pkgdir"/usr/lib/mailman/cgi-bin/*
  chmod 2755 "$pkgdir"/usr/lib/mailman/mail/mailman
  cd "$srcdir"
  # profiles
  install -Dm 755 $pkgname.profile.sh "$pkgdir/etc/profile.d/$pkgname.sh"
  install -Dm 755 $pkgname.profile.csh "$pkgdir/etc/profile.d/$pkgname.csh"
  # systemd timers and services
  install -t "${pkgdir}/usr/lib/systemd/system/" \
    -vDm644 ${pkgname}*.{service,timer}
  # sysusers.d
  install -vDm 644 $pkgname.sysusers \
    "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
