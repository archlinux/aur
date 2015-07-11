pkgbase=virtualbox-modules-e531
pkgname=('virtualbox-host-modules-e531' 'virtualbox-guest-modules-e531')
groups=('ThinkPad-E531')
pkgver=4.3.28
pkgrel=5
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-e531>=4.1' 'linux-e531<4.2'
             'linux-e531-headers>=4.1' 'linux-e531-headers<4.2'
             "virtualbox-host-dkms>=$pkgver"
             "virtualbox-guest-dkms>=$pkgver")

# remember to also adjust the .install files and the package deps below
_extramodules=extramodules-4.1-e531

build() {
  _kernver=$(cat /usr/lib/modules/$_extramodules/version)
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

package_virtualbox-host-modules-e531(){
  _kernver=$(cat /usr/lib/modules/$_extramodules/version)
  pkgdesc='Host kernel modules for VirtualBox'
  depends=('linux-e531>=4.1' 'linux-e531<4.2')
  replaces=('virtualbox-modules-e531')
  conflicts=('virtualbox-modules-e531')
  provides=("virtualbox-host-modules=$pkgver")
  install=virtualbox-host-modules-e531.install

  cd "dkms/vboxhost/$pkgver/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

package_virtualbox-guest-modules-e531(){
  _kernver=$(cat /usr/lib/modules/$_extramodules/version)
  pkgdesc='Guest kernel modules for VirtualBox'
  license=('GPL')
  depends=('linux-e531>=4.1' 'linux-e531<4.2')
  replaces=('virtualbox-modules-e531')
  conflicts=('virtualbox-modules-e531')
  provides=("virtualbox-guest-modules=$pkgver")
  install=virtualbox-host-modules-e531.install

  cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

# vim:set ts=2 sw=2 et:
md5sums=()
