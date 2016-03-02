

pkgbase=virtualbox-zen-modules
pkgname=('virtualbox-zen-host-modules' 'virtualbox-zen-guest-modules')
pkgver=5.0.14
pkgrel=1
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-zen>=' 'linux-zen<.1'
             'linux-zen-headers>=' 'linux-zen-headers<.1'
             "virtualbox-host-dkms>=$pkgver"
             "virtualbox-guest-dkms>=$pkgver")

# remember to also adjust the .install files and the package deps below
_extramodules=extramodules-4.4-zen

build() {
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  # dkms need modification to be run as user
  cp -r /var/lib/dkms .
  echo "dkms_tree='$srcdir/dkms'" > dkms.conf
  # build host modules
  msg2 'Host modules'
  dkms --dkmsframework dkms.conf build "vboxhost/$pkgver" -k "$_kernver"
  # build guest modules
  msg2 'Guest modules'
  dkms --dkmsframework dkms.conf build "vboxguest/$pkgver" -k "$_kernver"
}

package_virtualbox-zen-host-modules(){
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  pkgdesc='Host kernel modules for VirtualBox'
  depends=('linux>=' 'linux<.1')
  replaces=('virtualbox-modules')
  conflicts=('virtualbox-modules')
  install=virtualbox-host-modules.install

  cd "dkms/vboxhost/$pkgver/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

package_virtualbox-zen-guest-modules(){
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  pkgdesc='Guest kernel modules for VirtualBox'
  license=('GPL')
  depends=('linux>=' 'linux<.1')
  replaces=('virtualbox-archlinux-modules')
  conflicts=('virtualbox-archlinux-modules')
  install=virtualbox-guest-modules.install

  cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

# vim:set ts=2 sw=2 et:






