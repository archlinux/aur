# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: André-Sebastian Liebe <andre+arch at lianse dot eu>
# Contributor: schulmar 
# Contributor: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
_pkgbase="dddvb"
pkgname="dddvb-dkms"
pkgdesc="Official Digital Devices driver package as DKMS"
pkgver=0.9.40a
pkgrel=1
arch=("any")
url="https://github.com/DigitalDevices/dddvb"
license=("GPL2")
depends=("dkms")
replaces=('digitaldevices-dvb-drivers' 'dvbsky-dvb-drivers' 'technotrend-dvb-drivers')
conflicts=('digitaldevices-dvb-drivers' 'dvbsky-dvb-drivers' 'technotrend-dvb-drivers')
provides=('dddvb-dkms')
install="${pkgname}.install"
source=("https://github.com/DigitalDevices/$_pkgbase/archive/$pkgver.tar.gz")
sha256sums=('9a827c5ff265374c6cd4f1b245f355b336383b90061013b1bd9b955f53d3eb6d')

prepare() {
  cd "$srcdir"
  echo "PACKAGE_NAME=\"$_pkgbase\"" > dkms.conf
  echo "PACKAGE_VERSION=\"$pkgver\"" >> dkms.conf
  echo 'AUTOINSTALL="yes"' >> dkms.conf
  echo 'CHECK_MODULE_VERSION="no"' >> dkms.conf
  echo 'MAKE="make"' >> dkms.conf
  echo 'CLEAN="make clean"' >> dkms.conf

  cd "$srcdir/$_pkgbase-$pkgver"
  sed -i '/apps/d' Makefile
  sed -i 's/lib\/modules/usr\/lib\/modules/g' Makefile
  sed -i 's/mod\.c/mod/' Makefile
}

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  # make, so we can figure out which kernel modules are provided by this package
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
  rm -rf apps/
}

package() {
  install -D -m 0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"

  cd "$srcdir/$_pkgbase-$pkgver"

  cp -a * "$pkgdir/usr/src/$_pkgbase-$pkgver"
}
