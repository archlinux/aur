# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
_pkgbase="dddvb"
pkgname="dddvb-dkms"
pkgdesc="Official Digital Devices driver package as DKMS"
pkgver=0.9.20
pkgrel=1
arch=("i686" "x86_64")
url="http://download.digital-devices.de"
license=("GPL2")
depends=("dkms")
makedepends=('linux-headers')
replaces=('digitaldevices-dvb-drivers' 'dvbsky-dvb-drivers' 'technotrend-dvb-drivers')
conflicts=('digitaldevices-dvb-drivers' 'dvbsky-dvb-drivers' 'technotrend-dvb-drivers')
provides=('dddvb-dkms')
install="${pkgname}.install"
source=("https://github.com/DigitalDevices/$_pkgbase/archive/$pkgver.tar.gz")
md5sums=('9ad46fe47ba464081b1fe6e07ba6149d')

prepare() {
  cd "$srcdir"
  echo "PACKAGE_NAME=\"$_pkgbase\"" > dkms.conf
  echo "PACKAGE_VERSION=\"$pkgver\"" >> dkms.conf
  echo 'AUTOINSTALL="yes"' >> dkms.conf
  echo 'CHECK_MODULE_VERSION="no"' >> dkms.conf
  echo 'MAKE="make"' >> dkms.conf
  echo 'CLEAN="make clean"' >> dkms.conf

  cd "$srcdir/$_pkgbase-$pkgver"
  sed -i '/eth_rebuild_header/d' dvb-core/dvb_net.c
  sed -i '/apps/d' Makefile
  sed -i 's/CONFIG_DVB_OCTONET=m//' Makefile
}

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  make

  # Borrowed from dahdi-linux
  let "module_number=0" || true
  for file in $(find ./ -type f -name "*.ko"); do
        MODULE_LOCATION=$(dirname $file | cut -d\/ -f 2-)
        echo "BUILT_MODULE_NAME[$module_number]=\"$(basename $file .ko)\"" >> ../dkms.conf
        echo "BUILT_MODULE_LOCATION[$module_number]=\"$MODULE_LOCATION\"" >> ../dkms.conf
        echo "DEST_MODULE_LOCATION[$module_number]=\"/extramodules/$pkgname\"" >> ../dkms.conf
        let "module_number=${module_number}+1" || true
  done

  make clean
  find -name modules.order -delete
}

package() {
  install -D -m 0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"

  cd "$srcdir/$_pkgbase-$pkgver"

  cp -a * "$pkgdir/usr/src/$_pkgbase-$pkgver"
}
