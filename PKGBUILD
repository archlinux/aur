# Maintainer: Bill Durr <billyburly@gmail.com>
# Original by: Jameson Pugh <imntreal@gmail.com>

pkgname=ceton_infinitv
pkgver=2013.0326.2226
pkgrel=5
pkgdesc="Driver for Ceton InfiniTV"
arch=('i686' 'x86_64')
url="http://cetoncorp.com/infinitv_support/linux_drivers"
license=('GPL')
depends=('linux-headers')
source=(http://www.cetoncorp.com/downloads/${pkgname}_linux_driver_2013_0326_2226.tar.gz
	kernel.patch
	no-date-time-warn.patch
	0003_dev_trans_start.patch
	0004_last_rx-4.11.patch
	0005_signal_pending-4.11.patch)
sha256sums=('36f7cf010a705b283f165e9dd611dac6ef4729c55466752c3b70f3ffcc6d47d2'
            'dd642a60ba15bdada535beb000d8bddd87d0f97c70b1d37f7fa0e0af9e6b464c'
            '929a93e8fc35746de1a515e23a3dfe30e39573ea40d0c2e492be59f630f87918'
            'b2f56dfdb49fa59545beb8c61e4e021864c8187d604cbbeec2179dcc15a00fbf'
            '95b44af29a6ea642c5c54652d32b275202c83b28ec9f5bf82df6a294d8858097'
            '25217e4af33e1c1348a07891a1ef692ec628df7a51bd901d54ffc4fbf08d3fe6')
install=${pkgname}.install

prepare() {
  cd $srcdir/${pkgname}_linux_driver
  patch -p1 -i $srcdir/kernel.patch
  patch -p1 -i $srcdir/no-date-time-warn.patch
  patch -p1 -i $srcdir/0003_dev_trans_start.patch
  patch -p1 -i $srcdir/0004_last_rx-4.11.patch
  patch -p1 -i $srcdir/0005_signal_pending-4.11.patch
}

build() {
  cd "$srcdir/${pkgname}_linux_driver"
  make
}

package() {
  cd "$srcdir/${pkgname}_linux_driver"
  _major=$(pacman -Q linux | grep -Po "\d+\.\d+")
  _moddir=usr/lib/modules/extramodules-$_major-ARCH
  install -d ${pkgdir}/${_moddir}/
  install -D -m644 ctn91xx.ko ${pkgdir}/${_moddir}/
  gzip -9 ${pkgdir}/${_moddir}/ctn91xx.ko
  install -D -m644 98-ctn91xx.rules ${pkgdir}/etc/udev/rules.d/98-ctn91xx.rules
}
