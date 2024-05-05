# Co-Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: John Lane <archlinux at jelmail dot com>

pkgname=kryoflux
pkgdesc="USB Floppy Controller for Software Preservation"
pkgver=3.5
pkgrel=1
arch=('x86_64' 'aarch64')
url="http://www.kryoflux.com"
license=('custom')
provides=('capsimage')
conflicts=('capsimage')
depends=('libusb')
install=kryoflux.install
makedepends=('gendesk' 'imagemagick')
optdepends=('java-runtime: for the Kryoflux GUI')
source=("https://www.kryoflux.com/download/kryoflux_${pkgver}0_linux.tar.gz"
        'https://kryoflux.com/kryoflux-ui.jar'
        '80-kryoflux.rules'
        'kryoflux.conf'
        'kryoflux.sh'
        'https://webstore.kryoflux.com/catalog/images/kf_logo_big.png')
md5sums=('aa1a74bc681e2092278506ef4a2126f9'
         '44a067aa8d40dd0c8c53d6ff3ad8109c'
         '43ec7eb49fbdab703cafe146145fe0de'
         'ede10c48b2b1edc5c346e8814f07bcdb'
         '6811dc57633d7046a540b65e763aa338'
         'ede9a2b77643af8bf9d166c30827c170')

prepare() {
  cd "${srcdir}"
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "Control program for KryoFlux" --exec "kryoflux" --categories "Utility;Archiving"
  convert kf_logo_big.png -background None -gravity center -extent 400x400 kryoflux.png
}

package() {
  pkgroot=${pkgdir}/usr
  #pkgroot=${pkgdir}/usr/local

  cd "$srcdir"
  install -D 80-kryoflux.rules ${pkgdir}/etc/udev/rules.d/80-kryoflux.rules
  install -D kryoflux.conf ${pkgdir}/etc/modprobe.d/kryoflux.conf

  cd "$srcdir/Linux_Release${pkgver}0"
  install -d ${pkgroot}/{bin,lib}
  if [ "$CARCH" = "x86_64" ]
  then
    ar -xv dtc/${CARCH}/kryoflux-dtc_${pkgver}.0_amd64.deb data.tar.gz
  else
    ar -xv dtc/${CARCH}/kryoflux-dtc_${pkgver}.0_arm64.deb data.tar.gz
  fi
  tar -C ${pkgdir} -xvf data.tar.gz
  # rename dtc binary to kdtc to avoid clash with dtc package (suggested by @frankspace)
  mv ${pkgdir}/usr/bin/dtc ${pkgdir}/usr/bin/kdtc
  # we'll also copy dtc under original name to /usr/share/java/kryoflux
  install -Dm755 ${pkgdir}/usr/bin/kdtc ${pkgroot}/share/java/kryoflux/dtc
  install -Dm644 ${srcdir}/kryoflux-ui.jar ${pkgroot}/share/java/kryoflux/kryoflux-ui.jar

  # Documents
  install -d ${pkgdir}/usr/share/{licenses,doc}/kryoflux
  install -Dm644 LICENCE.txt ${pkgdir}/usr/share/licenses/kryoflux/LICENCE
  install docs/* ${pkgdir}/usr/share/doc/kryoflux
  install dtc/*README* ${pkgdir}/usr/share/doc/kryoflux
  cp -a schematics ${pkgdir}/usr/share/doc/kryoflux

  # Shell wrapper
  install -Dm755 ${srcdir}/kryoflux.sh ${pkgroot}/bin/kryoflux

  # Desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgroot}/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgroot}/share/pixmaps/${pkgname}.png"

  # resolve conflict with filesystem package
  mv ${pkgdir}/usr/lib64/libcapsimage.so ${pkgdir}/usr/lib/libcapsimage.so
  rmdir ${pkgdir}/usr/lib64
}

# vim: ft=sh syn=sh et
