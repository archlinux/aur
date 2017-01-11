# Maintainer: John Lane <archlinux at jelmail dot com>

pkgname=kryoflux
pkgdesc="USB Floppy Controller for Software Preservation"
pkgver=2.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.kryoflux.com"
license=('custom')
provides=('capsimage')
onflicts=('capsimage')
depends=('libusb')
optdepends=('jre7-openjdk: for the Kryoflux GUI')
source=("http://www.kryoflux.com/download/kryoflux_${pkgver}_linux.tar.bz2"
        '80-kryoflux.rules'
        'kryoflux.conf')
md5sums=('12d57dcc9657a90c583dded553b8a2e1'
         '43ec7eb49fbdab703cafe146145fe0de'
         'ede10c48b2b1edc5c346e8814f07bcdb')

package() {

  pkgroot=${pkgdir}/usr
  #pkgroot=${pkgdir}/usr/local

  cd "$srcdir"
  install -D 80-kryoflux.rules ${pkgdir}/etc/udev/rules.d/80-kryoflux.rules
  install -D kryoflux.conf ${pkgdir}/etc/modprobe.d/kryoflux.conf

  cd "$srcdir/kryoflux_${pkgver}_linux"
  install -d ${pkgroot}/{bin,lib}

  install dtc/${CARCH}/static/dtc dtc/kryoflux-ui.jar ${pkgroot}/bin
  cp -P dtc/${CARCH}/lib* ${pkgroot}/lib

  # Firmwares: choose one or the other
  install -D dtc/firmware_kf_usb_rosalie.bin ${pkgdir}/usr/lib/firmware/firmware_kf_usb_rosalie.bin
  install -D dtc/firmware_fast/firmware_kf_usb_rosalie.bin ${pkgdir}/usr/lib/firmware/firmware_kf_usb_rosalie.bin

  # Documents
  install -d ${pkgdir}/usr/share/{licenses,doc}/kryoflux
  install LICENCE.txt ${pkgdir}/usr/share/licenses/kryoflux/LICENCE
  install docs/* ${pkgdir}/usr/share/doc/kryoflux
  install dtc/*README* ${pkgdir}/usr/share/doc/kryoflux
  cp -a schematics ${pkgdir}/usr/share/doc/kryoflux
  
}

# vim: ft=sh syn=sh et
