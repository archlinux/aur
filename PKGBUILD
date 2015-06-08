# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sébastien Luttringer

pkgbase=virtualbox-modules-mainline
pkgname=('virtualbox-host-modules-mainline' 'virtualbox-guest-modules-mainline')
pkgver=4.3.28
pkgrel=1
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
depends=('linux-mainline>=4.1rc1' 'linux-mainline<4.2rc1')
makedepends=('dkms' 'linux-mainline-headers>=4.1rc1' 'linux-mainline-headers<4.2rc1' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver")
# remember to also adjust the .install files and the package deps below
_extramodules=extramodules-4.1-mainline

prepare() {
  # dkms need modification to be run as user
  cp -r /var/lib/dkms .
  echo "dkms_tree='$srcdir/dkms'" > dkms.conf

  # workaround to patch virtualbox-guest for linux 3.19
  # credits: Philip Müller <philm@manjaro.org>
  rm -r $srcdir/dkms/vboxguest/$pkgver/source
  cp -r /usr/src/vboxguest-$pkgver $srcdir/dkms/vboxguest/$pkgver/source
  sed -i -e 's|>f_dentry|>f_path.dentry|g' $srcdir/dkms/vboxguest/$pkgver/source/vboxsf/dirops.c
  sed -i -e 's|>f_dentry|>f_path.dentry|g' $srcdir/dkms/vboxguest/$pkgver/source/vboxsf/regops.c
}

build() {
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  # dkms need modification to be run as user
  
  # NOTE: this is made above in prepare() section
  # cp -r /var/lib/dkms .
  # echo "dkms_tree='$srcdir/dkms'" > dkms.conf
  
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
  depends=('linux-mainline>=4.1rc1' 'linux-mainline<4.2rc1')
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
  depends=('linux-mainline>=4.1rc1' 'linux-mainline<4.2rc1')
  provides=("virtualbox-guest-modules")
  conflicts=('virtualbox-modules-mainline')
  install=virtualbox-guest-modules-mainline.install

  cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

