# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Nathan Owe <ndowens04 at gmail>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=freeipmi
pkgver=1.4.8
pkgrel=1
pkgdesc="sensor monitoring, system event monitoring, power control, and serial-over-LAN (SOL)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/freeipmi/"
license=('GPL')
depends=('libgcrypt')
options=('!libtool')
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
        'bmc-watchdog.service'
        'ipmidetectd.service'
        'ipmiseld.service')
md5sums=('df800f7553d6a7d55e2a928abc65dadb'
         '8993098bae8cc6b134a330105373d258'
         'bb8bd4f7e5dddbbb15e309c3f1090551'
         'd8b0658fb8037bf4c09b9179223e4972')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --localstatedir=/var/lib \
    --infodir=/usr/share/info

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir/ install

  rm -Rf $pkgdir/usr/share/info/dir

  # Move init scripts and config to Arch paths
  mv $pkgdir/etc/sysconfig $pkgdir/etc/conf.d
  
  # We need system units, not rc scripts
  rm -Rf "$pkgdir"/etc/init.d/
  for svcname in bmc-watchdog ipmidetectd ipmiseld ; do
    install -Dm644 "$srcdir"/${svcname}.service \
      "$pkgdir"/usr/lib/systemd/system/${svcname}.service
  done
}

# vim:set ts=2 sw=2 et:
