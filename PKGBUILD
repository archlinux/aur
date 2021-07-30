# Co-Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: John Lane <archlinux at jelmail dot com>

pkgname=kryoflux
pkgdesc="USB Floppy Controller for Software Preservation"
pkgver=2.6
pkgrel=3
arch=('i686' 'x86_64')
url="http://www.kryoflux.com"
license=('custom')
provides=('capsimage')
conflicts=('capsimage')
depends=('libusb')
makedepends=('gendesk')
optdepends=('jre7-openjdk: for the Kryoflux GUI' 'archlinux-java-run: for the Kryoflux GUI')
source=("http://www.kryoflux.com/download/kryoflux_${pkgver}_linux.tar.bz2"
        '80-kryoflux.rules'
        'kryoflux.conf'
        'kryoflux.sh'
        'kryoflux.png')
md5sums=('12d57dcc9657a90c583dded553b8a2e1'
         '43ec7eb49fbdab703cafe146145fe0de'
         'ede10c48b2b1edc5c346e8814f07bcdb'
         '0c9d40001d3ebed40dd3032cbdc7ba54'
         '510bdad5af6d032a9543a80ae680295e')

prepare() {
  cd "${srcdir}"
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "Control program for KryoFlux" --exec "kryoflux" --categories "Utility;Archiving"
}

package() {

  pkgroot=${pkgdir}/usr
  #pkgroot=${pkgdir}/usr/local

  cd "$srcdir"
  install -D 80-kryoflux.rules ${pkgdir}/etc/udev/rules.d/80-kryoflux.rules
  install -D kryoflux.conf ${pkgdir}/etc/modprobe.d/kryoflux.conf

  cd "$srcdir/kryoflux_${pkgver}_linux"
  install -d ${pkgroot}/{bin,lib}
  # rename dtc binary to kdtc to avoid clash with dtc package (suggested by @frankspace)
  install dtc/${CARCH}/static/dtc ${pkgroot}/bin/kdtc
  install -Dm644 dtc/kryoflux-ui.jar ${pkgroot}/share/java/kryoflux/kryoflux-ui.jar
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

  # Shell wrapper
  install -Dm755 ${srcdir}/kryoflux.sh ${pkgroot}/bin/kryoflux

  # Desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgroot}/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgroot}/share/pixmaps/${pkgname}.png"
}

# vim: ft=sh syn=sh et
