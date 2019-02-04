# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
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
pkgver=1.6.3
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
sha256sums=('aad4e735a7ac4a1f8ade20caadb35dfefc2a352fa2ef41d3f6e589179917e1e9'
            'ac2aadac0f1be10134b2f2aef4652dfa9c32bf48bcb0326d39a583cce4bf2d56'
            '53e79cb652e8840a5e3178b797544ef44d6405f74a862d8b4d430165cf070e35'
            'd8a117fecae35c9d9f3fe3572d6abd660744ceebfe2fa1cc9fabddd0e9a38746')

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
