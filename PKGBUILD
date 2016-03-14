# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Oscar Molin <oscarmolin@gmail.com>

pkgbase=virtualbox-modules-mainline
pkgname=('virtualbox-host-modules-mainline' 'virtualbox-guest-modules-mainline')
pkgver=5.0.16
pkgrel=2
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
depends=('linux-mainline>=4.5rc1' 'linux-mainline<4.6rc1')
makedepends=('dkms' 'linux-mainline-headers>=4.5rc1' 'linux-mainline-headers<4.6rc1' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver")
# remember to also adjust the .install files and the package deps below
_extramodules=extramodules-4.5-mainline

build() {
  _kernver=$(cat /usr/lib/modules/$_extramodules/version)
  # dkms need modification to be run as user

  rm -rf dkms/vboxguest/$pkgver/source
  cp -r /var/lib/dkms .

  mkdir -p $srcdir/usr/src
  cp -r /usr/src/vboxhost-${pkgver}_OSE $srcdir/usr/src/vboxhost-$pkgver
  cp -r /usr/src/vboxguest-${pkgver}_OSE $srcdir/usr/src/vboxguest-$pkgver

  echo "dkms_tree='$srcdir/dkms'" > dkms.conf
  echo "source_tree='$srcdir/usr/src'" >> dkms.conf

  # build host modules
  msg2 'Host modules'
  dkms --dkmsframework dkms.conf build "vboxhost/$pkgver" -k "$_kernver"
  # build guest modules
  msg2 'Guest modules'
  dkms --dkmsframework dkms.conf build "vboxguest/$pkgver" -k "$_kernver"
}

package_virtualbox-host-modules-mainline(){
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  pkgdesc='Host kernel modules for VirtualBox running under linux-mainline'
  depends=('linux-mainline>=4.5rc1' 'linux-mainline<4.6rc1')
  provides=("virtualbox-host-modules")
  conflicts=('virtualbox-modules-mainline')
  install=virtualbox-host-modules-mainline.install

  cd "dkms/vboxhost/$pkgver/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

package_virtualbox-guest-modules-mainline(){
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  pkgdesc='Guest kernel modules for VirtualBox running under linux-mainline'
  license=('GPL')
  depends=('linux-mainline>=4.5rc1' 'linux-mainline<4.6rc1')
  provides=("virtualbox-guest-modules")
  conflicts=('virtualbox-modules-mainline')
  install=virtualbox-guest-modules-mainline.install

  cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

