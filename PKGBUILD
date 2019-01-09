# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Bazon <bazonbloch@arcor.de> 
# Contributor: Christian Bühler <christian@cbuehler.de>
# Contributor: Zsolt Udvari <udvzsolt@gmail.com>

pkgname=activdriver
pkgver=5.17.14
pkgrel=1
pkgdesc="The kernel mode and X11 drivers for Promethean ActivBoard and ActivHub."
arch=('i686' 'x86_64')
url="https://support.prometheanworld.com/product/activdriver"
license=('unknown')
makedepends=(linux-headers)
optdepends=('activinspire: activboard presentation'
            'activtools: hardware calibration')
install=$pkgname.install
source_x86_64=(
	"http://activsoftware.co.uk/linux/repos/driver/ubuntu/pool/oss/a/$pkgname/${pkgname}_$pkgver-0~Ubuntu~1604_amd64.deb"
        "10-promethean.conf"
	"activdriver.install")
source_i686=(
	"http://activsoftware.co.uk/linux/repos/driver/ubuntu/pool/oss/a/$pkgname/${pkgname}_$pkgver-0~Ubuntu~1604_i386.deb"
        "10-promethean.conf"
	"activdriver.install")
md5sums_i686=('274ac5eb1c01c09acf865d97afd81130'
              '11effc25fd592acacb9f9f3108618963'
              '8a8a6ddd6741a80a5839593ed385cd9a')
md5sums_x86_64=('29ce78dcf3dacef49047343064e39760'
                '11effc25fd592acacb9f9f3108618963'
                '8a8a6ddd6741a80a5839593ed385cd9a')


build() {
  tar xf data.tar.xz
  echo " "
  echo "Attention!"
  echo "Build will fail if run in a directory with space(s) in its path."
  # (reason: makefile of the source. if you know how to fix: please tell!)
  echo " "
  make -C /lib/modules/$(uname -r)/build SUBDIRS="$srcdir"/usr/src/promethean/kernel modules
  sed -i "s%KERN_INC = /usr/src/promethean%KERN_INC = ..%" usr/src/promethean/activlc/Makefile
  BUILD=release make -C usr/src/promethean/activlc
  sed -i s%/usr/local/bin/%%g usr/bin/promethean.sh
}

package() {
  mkdir -p "$pkgdir"/usr 
  cp -r etc lib "$pkgdir"
  cp -r usr/bin usr/lib usr/share "$pkgdir"/usr
  install -D usr/src/promethean/activlc/release/activlc "$pkgdir"/usr/bin/activlc
  _extmoddir=$(uname -r | sed "s@\([0-9]*\.[0-9]*\)\.[0-9]*-[0-9]*\(.*\)@\1\2@")
  
  # changed compared to pkgrel=1: needs to be this path now:
  _moddir="/usr/lib/modules/extramodules-${_extmoddir}"/kernel/drivers/input/tablet/

  install -m644 -D usr/src/promethean/kernel/promethean.ko \
    "$pkgdir${_moddir}"/promethean.ko
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  install -D 10-promethean.conf "$pkgdir"/etc/X11/xorg.conf.d/10-promethean.conf

  # changed compared to pkgrel=1: move /lib to /usr/lib to match arch standards
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/ 
  rmdir "${pkgdir}"/lib

  # changed compared to pkgrel=1: load module on boot. 
  # If you don't want this, delete the following lines and load it manually with sudo modprobe promethean
  mkdir -p "$pkgdir"/etc/modules-load.d
  echo "promethean" > "$pkgdir"/etc/modules-load.d/promethean.conf
}
