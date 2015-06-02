# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: gregor <gregor@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

_gentoo_mirror='ftp://ftp.snt.utwente.nl/pub/linux/gentoo/distfiles/'
_gentoo_patchver=4

pkgname=vixie-cron
arch=("i686" "x86_64")
pkgver=4.1
pkgrel=12
license=("GPL")
pkgdesc="Paul Vixie's cron daemon, a fully featured crond implementation"
url="ftp://ftp.isc.org/isc/cron/"
depends=('glibc')
provides=('cron' 'dcron')
backup=('etc/crontab')
source=("$_gentoo_mirror/${pkgname}-${pkgver}.tar.bz2"
        "$_gentoo_mirror/${pkgname}-${pkgver}-gentoo-r${_gentoo_patchver}.patch.bz2"
        'crond.service'
        'cronrunparts'
        'crontab') 
md5sums=('09dc04f9879684d27c64c910174a9536'
         'c674b03c6e76798b1c74f6070df167cc'
         '2765095708207c2ae4ff31b5af94181d'
         '00ede56aadf073c839e600033fbd6cb4'
         'b8b1d315dd2f92528dc6fa7ae8cef32b')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -p1 < "$srcdir"/$pkgname-$pkgver-gentoo-r$_gentoo_patchver.patch

  sed -i Makefile \
      -e 's|$(DESTROOT)/sbin|$(DESTROOT)/bin|'
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  make all
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/man/{man8,man1,man5}
  mkdir -p "$pkgdir"/etc/cron.{d,hourly,daily,weekly,monthly}
  mkdir -p "$pkgdir"/var/spool/cron

  install -m 111 -o root -s cron "$pkgdir"/usr/bin
  install -m 4111 -o root -s crontab "$pkgdir"/usr/bin
  install -m 755 -o root "$srcdir"/cronrunparts "$pkgdir"/usr/bin
  chmod 755 "$pkgdir"/usr/bin/cronrunparts

  cp crontab.1 "$pkgdir"/usr/man/man1
  cp cron.8 "$pkgdir"/usr/man/man8
  cp crontab.5 "$pkgdir"/usr/man/man5

  install -Dm644 "$srcdir"/crond.service "$pkgdir"/usr/lib/systemd/system/crond.service
  
  install "$srcdir"/crontab -m 600 -o root "$pkgdir"/etc
}
