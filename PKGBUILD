# Maintainer: Luca Stefani <luca.stefani.ge1@gmail.com>

pkgbase=(virtualbox-luca020400-modules)
pkgname=(virtualbox-luca020400-host-modules virtualbox-luca020400-guest-modules)
pkgver=5.0.14
pkgrel=1
arch=('x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-luca020400-headers' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver" 'dkms')

_extramodules=extramodules-4.4-luca020400
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
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

package_virtualbox-luca020400-host-modules() {
  pkgdesc='Host kernel modules for VirtualBox running under Linux-luca020400.'
  provides=("virtualbox-host-modules")
  depends=('linux-ck>=4.4')
  install=host.install

  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
  cd "dkms/vboxhost/$pkgver/$_kernver/$CARCH/module"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/host.install"
}

package_virtualbox-luca020400-guest-modules() {
  pkgdesc='Guest kernel modules for VirtualBox running under Linux-luca020400.'
  license=('GPL')
  provides=("virtualbox-guest-modules")
  depends=('linux-ck>=4.4')
  install=guest.install

  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
  cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/guest.install"
}
