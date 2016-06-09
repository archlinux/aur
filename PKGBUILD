# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Oscar Molin <oscarmolin@gmail.com>

pkgbase=virtualbox-modules-mainline
pkgname=('virtualbox-host-modules-mainline' 'virtualbox-guest-modules-mainline')
pkgver=5.0.20
pkgrel=2
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
depends=('linux-mainline>=4.7rc1' 'linux-mainline<4.8rc1')
makedepends=('dkms' 'linux-mainline-headers>=4.7rc1' 'linux-mainline-headers<4.8rc1' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver")
# remember to also adjust the .install files and the package deps below
_extramodules=extramodules-4.7-mainline

prepare() {
  _kernver=$(cat /usr/lib/modules/$_extramodules/version)
  # dkms need modification to be run as user

  rm -rf dkms/vboxhost/${pkgver}_OSE/source
  rm -rf dkms/vboxguest/${pkgver}_OSE/source
  cp -r /var/lib/dkms .

  echo "dkms_tree='$srcdir/dkms'" > dkms.conf

  # add patches here if needed
  rm -r $srcdir/dkms/vboxhost/${pkgver}_OSE/source
  cp -r /usr/src/vboxhost-${pkgver}_OSE $srcdir/dkms/vboxhost/${pkgver}_OSE/source

  cp ../VBoxNetAdp-linux.c $srcdir/dkms/vboxhost/${pkgver}_OSE/source/vboxnetadp/linux/VBoxNetAdp-linux.c
  
  rm -r $srcdir/dkms/vboxguest/${pkgver}_OSE/source
  cp -r /usr/src/vboxguest-${pkgver}_OSE $srcdir/dkms/vboxguest/${pkgver}_OSE/source

  cp ../vbox_main.c $srcdir/dkms/vboxguest/${pkgver}_OSE/source/vboxvideo/vbox_main.c
  cp ../vbox_mode.c $srcdir/dkms/vboxguest/${pkgver}_OSE/source/vboxvideo/vbox_mode.c
  cp ../vbox_drv.h $srcdir/dkms/vboxguest/${pkgver}_OSE/source/vboxvideo/vbox_drv.h

  cd $srcdir
}

build() {

  # build host modules
  msg2 'Host modules'
  dkms --dkmsframework dkms.conf build "vboxhost/${pkgver}_OSE" -k "$_kernver"
  # build guest modules
  msg2 'Guest modules'
  dkms --dkmsframework dkms.conf build "vboxguest/${pkgver}_OSE" -k "$_kernver"
}

package_virtualbox-host-modules-mainline(){
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  pkgdesc='Host kernel modules for VirtualBox running under linux-mainline'
  depends=('linux-mainline>=4.7rc1' 'linux-mainline<4.8rc1')
  provides=("virtualbox-host-modules")
  conflicts=('virtualbox-modules-mainline')
  install=virtualbox-host-modules-mainline.install

  cd "dkms/vboxhost/${pkgver}_OSE/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

package_virtualbox-guest-modules-mainline(){
  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
  pkgdesc='Guest kernel modules for VirtualBox running under linux-mainline'
  license=('GPL')
  depends=('linux-mainline>=4.7rc1' 'linux-mainline<4.8rc1')
  provides=("virtualbox-guest-modules")
  conflicts=('virtualbox-modules-mainline')
  install=virtualbox-guest-modules-mainline.install

  cd "dkms/vboxguest/${pkgver}_OSE/$_kernver/$CARCH/module"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

