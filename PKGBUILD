# Maintainer: Björn Bidar <theodorstormgrade@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname='virtualbox-host-modules-pf'
pkgver=6.1.10
pkgrel=1
pkgdesc='Virtualbox host kernel modules for Arch Kernel'
arch=('x86_64')
url='https://virtualbox.org/'
license=('GPL')
makedepends=('linux-pf-headers'
             "virtualbox-host-dkms=$pkgver")
replaces=('virtualbox-modules-pf' 'virtualbox-host-modules-pf')
conflicts=('virtualbox-modules-pf' 'virtualbox-host-modules-pf'
           'virtualbox-host-dkms')
provides=('VIRTUALBOX-HOST-MODULES')

build() {
  _kernver="$(</usr/src/linux-pf/version)"

  dkms build --dkmstree "$srcdir" -m vboxhost/${pkgver}_OSE -k ${_kernver}
}

package(){
  depends=('linux-pf')

  _kernver="$(</usr/src/linux-pf/version)"

  install -Dt "$pkgdir/usr/lib/modules/$_kernver/extramodules" -m0644 \
    vboxhost/${pkgver}_OSE/${_kernver}/${CARCH}/module/*

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec xz -T1 {} +

  # systemd module loading
  printf '%s\n' vboxdrv vboxnetadp vboxnetflt |
    install -D -m0644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}

