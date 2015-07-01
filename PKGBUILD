# Maintainer: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>

pkgname=ntrig_calib-bzr
pkgver=2
pkgrel=1
epoch=1
pkgdesc="Calibration tool for touchscreens based on N-Trig technology (Unofficial)"
arch=('i686' 'x86_64')
url='https://code.launchpad.net/~rafi-seas/+junk/ntrig_calib'
license=('GPL')
depends=('libusb-compat')
makedepends=('bzr')
provides=('ntrig_calib')
conflicts=('ntrig_calib')
#source=("${pkgname%-*}::bzr+http://bazaar.launchpad.net/~rafi-seas/+junk/ntrig_calib/")
source=("${pkgname%-*}::bzr+http://bazaar.launchpad.net/~rafi-seas/%2Bjunk/ntrig_calib/")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  bzr revno
}

build() {
  cd "$srcdir/${pkgname%-*}"
  sed -i \
    -e 's|^#!/usr/bin/sudo /bin/sh$|#!/bin/sh\n\n[[ $UID -ne 0 ]] \&\& echo "error: you cannot perform this operation unless you are root." >\&2 \&\& exit 1|' \
    calib.sh firmware_version.sh
  sed -i \
    -e 's|^make calib && ./calib$|/usr/lib/ntrig_calib/calib|' \
    -e 's|^make firmware && ./firmware$|/usr/lib/ntrig_calib/firmware|' \
    calib.sh
  sed -i \
    -e 's|^make firmware && ./firmware$|/usr/lib/ntrig_calib/firmware|' \
    firmware_version.sh
  make
}

package() {
  cd "$srcdir/${pkgname%-*}"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/ntrig_calib/calib.sh" "$pkgdir/usr/bin/ntrig_calib"
  ln -s "/usr/lib/ntrig_calib/firmware_version.sh" "$pkgdir/usr/bin/ntrig_firmware_version"

  install -dm755 "$pkgdir/usr/lib/ntrig_calib"
  install -m755 -t "$pkgdir/usr/lib/ntrig_calib" \
    calib calib.sh firmware firmware_version.sh mode
}
