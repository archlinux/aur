# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=wireguard-module-arch
pkgver=0.0.20180218
pkgrel=1
pkgdesc='wireguard kernel module for Arch Kernel'
_linux_major=4
_linux_minor=15
arch=('x86_64')
url='http://www.wireguard.com/'
license=('GPL')
makedepends=("linux>=${_linux_major}.${_linux_minor}"
             "linux<${_linux_major}.$((_linux_minor+1))"
             "linux-headers>=${_linux_major}.${_linux_minor}"
             "linux-headers<${_linux_major}.$((_linux_minor+1))"
             "wireguard-dkms>=$pkgver")
replaces=('wireguard-dkms')
conflicts=('wireguard-dkms')
provides=('WIREGUARD-MODULE')

_extramodules=extramodules-${_linux_major}.${_linux_minor}-ARCH

package(){
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"

  cd "/var/lib/dkms/wireguard/${pkgver}/$_kernver/$CARCH/module"
  install -Dt "$pkgdir/usr/lib/modules/$_extramodules" -m644 *

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec xz -T1 {} +

  # systemd module loading
  printf "wireguard\n" |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
