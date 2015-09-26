# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Oscar Molin <oscarmolin@gmail.com>

pkgbase=virtualbox-modules-mainline
pkgname=('virtualbox-host-modules-mainline' 'virtualbox-guest-modules-mainline')
pkgver=5.0.4
pkgrel=2
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
depends=('linux-mainline>=4.3rc1' 'linux-mainline<4.4rc1')
makedepends=('dkms' 'linux-mainline-headers>=4.3rc1' 'linux-mainline-headers<4.4rc1' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver")
# remember to also adjust the .install files and the package deps below
_extramodules=extramodules-4.3-mainline

build() {
  _kernver=$(cat /usr/lib/modules/$_extramodules/version)
  # dkms need modification to be run as user

  rm -rf dkms/vboxhost/$pkgver/source
  cp -r /var/lib/dkms .

  echo patch vboxhost files
  # copy this dir to local dir so we can patch it.
  cp -r -L dkms/vboxhost/$pkgver/source dkms/vboxhost/$pkgver/src
  rm dkms/vboxhost/$pkgver/source
  mv dkms/vboxhost/$pkgver/src dkms/vboxhost/$pkgver/source

  patch dkms/vboxhost/$pkgver/source/vboxdrv/linux/SUPDrv-linux.c < ../SUPDrv-linux.patch
  patch dkms/vboxhost/$pkgver/source/vboxnetadp/linux/VBoxNetAdp-linux.c < ../VBoxNetAdp-linux.patch

  echo "dkms_tree='$srcdir/dkms'" > dkms.conf
  
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
  depends=('linux-mainline>=4.3rc1' 'linux-mainline<4.4rc1')
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
  depends=('linux-mainline>=4.3rc1' 'linux-mainline<4.4rc1')
  provides=("virtualbox-guest-modules")
  conflicts=('virtualbox-modules-mainline')
  install=virtualbox-guest-modules-mainline.install

  cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

