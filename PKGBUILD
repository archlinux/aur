# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sébastien Luttringer
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=virtualbox-modules-lts
pkgname=('virtualbox-host-modules-lts' 'virtualbox-guest-modules-lts')
pkgver=6.1.4
pkgrel=5
case "$CARCH" in
  x86_64)
    _linux_major=5
    _linux_minor=4
    ;;
  i686)
    _linux_major=4
    _linux_minor=19
    ;;
esac
arch=('x86_64' 'i686')
url='http://virtualbox.org'
license=('GPL')
_linux_cur=${_linux_major}.${_linux_minor}
_linux_next=${_linux_major}.$((_linux_minor + 1))
makedepends=("linux-lts>=$_linux_cur" "linux-lts<$_linux_next"
             "linux-lts-headers>=$_linux_cur" "linux-lts-headers<$_linux_next"
             "virtualbox-host-dkms>=$pkgver"
             "virtualbox-guest-dkms>=$pkgver")

_kernver="$(pacman -Si linux-lts|awk '/Version/{print$3}')" || \
_kernver="$(pacman -Qi linux-lts|awk '/Version/{print$3}')"
_kernver="${_kernver}-lts"

build() {

    dkms build --dkmstree "$srcdir" -m vboxhost/${pkgver}_OSE -k $_kernver
    dkms build --dkmstree "$srcdir" -m vboxsf/${pkgver}_OSE -k $_kernver
}

package_virtualbox-host-modules-lts(){

  pkgdesc='Virtualbox host kernel modules for LTS Kernel'
  depends=("linux-lts>=$_linux_cur" "linux-lts<$_linux_next")
  replaces=('virtualbox-modules' 'virtualbox-host-modules')
  conflicts=('virtualbox-modules' 'virtualbox-host-modules'
			 'virtualbox-host-dkms')
  provides=('VIRTUALBOX-HOST-MODULES-LTS')

  install -Dt "$pkgdir/usr/lib/modules/$_kernver/extramodules" -m0644 \
    vboxhost/${pkgver}_OSE/$_kernver/$CARCH/module/*

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec xz -T1 {} +

  # systemd module loading
  printf '%s\n' vboxdrv vboxnetadp vboxnetflt |
    install -D -m0644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}

package_virtualbox-guest-modules-lts(){

  pkgdesc='Virtualbox guest kernel modules for LTS Kernel'
  depends=("linux-lts>=$_linux_cur" "linux-lts<$_linux_next")
  replaces=('virtualbox-archlinux-modules' 'virtualbox-guest-modules')
  conflicts=('virtualbox-archlinux-modules' 'virtualbox-guest-modules'
             'virtualbox-guest-dkms')
  provides=('VIRTUALBOX-GUEST-MODULES-LTS')

  install -Dt "$pkgdir/usr/lib/modules/$_kernver/extramodules" -m0644 \
    vboxsf/${pkgver}_OSE/$_kernver/$CARCH/module/*

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec xz -T1 {} +
}

# vim:set sw=2 et:
