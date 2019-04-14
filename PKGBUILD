# Maintainer: David Bernheisel <david+aur@bernheisel.com>
# Based on the brscan4 PKGBUILD by Harey

license=('GPL' 'custom:Brother')
arch=('i686' 'x86_64')
pkgname=brscan5
pkgver=1.1.0_0
pkgrel=1
pkgdesc="SANE drivers from Brother for brscan5 compatible models"
depends=('sane' 'libusb-compat')
optdepends=('gtk2: for running brscan_gnetconfig')
url="http://support.brother.com"
install=brscan5.install

[ "$CARCH" = "x86_64" ] && pkg="dlf104036/${pkgname}-${pkgver/_/-}.x86_64.rpm" || pkg="dlf104035/${pkgname}-${pkgver/_/-}.i386.rpm"
[ "$CARCH" = "x86_64" ] && pkg_md5sum="5453ba052048780120a37d319cef1ce8" || pkg_md5sum="18988663fc0c958d12668ddee9e36bd5"

source=(
  "https://download.brother.com/welcome/$pkg"
  "http://www.brother.com/agreement/English_sane/agree.html"
  mk-udev-rules
)
md5sums=(
  $pkg_md5sum
  'ccffb9a6f6d436b21be25b0241068981'
  'ca07cab058b704b7b12ba076d00be2f0'
)

build() {
  cd "$srcdir"
  umask 022
  mkdir -p etc/udev/rules.d
  ./mk-udev-rules opt/brother/scanner/brscan5/{brscan5.ini,models/*.ini} > etc/udev/rules.d/40-$pkgname.rules
}

package() {
  cp -r $srcdir/etc $pkgdir
  cp -r $srcdir/opt $pkgdir
  cp -r $srcdir/usr $pkgdir

  install -D -m644 $srcdir/agree.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html

  mkdir -p $pkgdir/usr/lib/sane
  cd $pkgdir/usr/lib/sane
  mv $pkgdir/opt/brother/scanner/brscan5/*.so.1.0.7 .
  ln -sf libsane-brother5.so.1.0.7 libsane-brother5.so.1
  ln -sf libsane-brother5.so.1 libsane-brother5.so

  cd $pkgdir/usr/lib
  mv $pkgdir/opt/brother/scanner/brscan5/*.so.1.0.0 .
  ln -sf libLxBsNetDevAccs.so.1.0.0 libLxBsNetDevAccs.so.1
  ln -sf libLxBsNetDevAccs.so.1 libLxBsNetDevAccs.so

  ln -sf libLxBsDeviceAccs.so.1.0.0 libLxBsDeviceAccs.so.1
  ln -sf libLxBsDeviceAccs.so.1 libLxBsDeviceAccs.so

  ln -sf libLxBsScanCoreApi.so.1.0.0 libLxBsScanCoreApi.so.1
  ln -sf libLxBsScanCoreApi.so.1 libLxBsScanCoreApi.so

  ln -sf libLxBsUsbDevAccs.so.1.0.0 libLxBsUsbDevAccs.so.1
  ln -sf libLxBsUsbDevAccs.so.1 libLxBsUsbDevAccs.so
}
