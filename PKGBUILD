# $Id: PKGBUILD 217568 2017-03-20 13:42:00Z tpowa $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sébastien Luttringer
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=virtualbox-modules-lts
pkgname=('virtualbox-host-modules-lts' 'virtualbox-guest-modules-lts')
pkgver=5.1.18
pkgrel=2
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-lts>=4.9' 'linux-lts<4.10'
             'linux-lts-headers>=4.9' 'linux-lts-headers<4.10'
             "virtualbox-host-dkms>=$pkgver"
             "virtualbox-guest-dkms>=$pkgver")

# remember to also adjust the .install files and the package deps below
_extramodules=extramodules-4.9-lts

package_virtualbox-host-modules-lts(){
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  pkgdesc='Virtualbox host kernel modules for LTS Kernel'
  depends=('linux-lts>=4.9' 'linux-lts<4.10')
  replaces=('virtualbox-modules' 'virtualbox-host-modules')
  conflicts=('virtualbox-modules' 'virtualbox-host-modules'
			 'virtualbox-host-dkms')
  provides=('VIRTUALBOX-HOST-MODULES-LTS')
  install=virtualbox-modules-lts.install

  cd "/var/lib/dkms/vboxhost/${pkgver}_OSE/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"

  # compress earch modules individually
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

  # systemd module loading
  install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
  printf "vboxdrv\nvboxpci\nvboxnetadp\nvboxnetflt\n" >  \
    "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}

package_virtualbox-guest-modules-lts(){
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  pkgdesc='Virtualbox guest kernel modules for LTS Kernel'
  license=('GPL')
  depends=('linux-lts>=4.9' 'linux-lts<4.10')
  replaces=('virtualbox-archlinux-modules' 'virtualbox-guest-modules')
  conflicts=('virtualbox-archlinux-modules' 'virtualbox-guest-modules'
             'virtualbox-guest-dkms')
  provides=('VIRTUALBOX-GUEST-MODULES-LTS')
  install=virtualbox-modules-lts.install

  cd "/var/lib/dkms/vboxguest/${pkgver}_OSE/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"

  # compress earch modules individually
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

  # systemd module loading
  install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
  printf "vboxguest\nvboxsf\nvboxvideo\n" >  \
    "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:







