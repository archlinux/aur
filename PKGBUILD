# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=tscdriver
pkgver=1.2.13
pkgrel=1
pkgdesc="Drivers for TSC Printers"
arch=(x86_64)
url="https://www.tscprinters.com"
license=('custom:proprietary')
depends=(gtk2 libusb)
makedepends=(unzip)
source=("$pkgname-$pkgver.zip::https://fs.tscprinters.com/system/files/linux64_v${pkgver}.zip")
sha256sums=('8661fa914b0b07b4c3f32ab9900397a4cb3503e1f1e35aa081e21e6f20c6a2dd')

prepare() {
  #unzip linux64_v${pkgver}/Linux64_v${pkgver}.zip
  tar xf Linux64_v${pkgver}/barcodedriver-${pkgver}-x86_64.tar.gz
}

package() {
  cd barcodedriver-$pkgver

  install -vdm755 "$pkgdir/usr/bin/"
  install -vm755 thermalprinterui               "$pkgdir/usr/bin/"
  install -vm4755 thermalprinterut              "$pkgdir/usr/bin/"

  install -vdm755 "$pkgdir/usr/lib/cups/backend/"
  install -vm755 backend/brusb                  "$pkgdir/usr/lib/cups/backend/"
  install -vm755 backend/brsocket               "$pkgdir/usr/lib/cups/backend/"

  install -vdm755 "$pkgdir/usr/lib/cups/filter/"
  install -vm755 rastertobarcodetspl            "$pkgdir/usr/lib/cups/filter/rastertobarcodetspl"

  install -vdm755 "$pkgdir/usr/share/cups/model/tsc-ppds/"
  install -vm644 ppd/*.ppd                      "$pkgdir/usr/share/cups/model/tsc-ppds/"

  install -vDm644 thermalprinterui.png          "$pkgdir/usr/share/icons/hicolor/128x128/apps/thermalprinterui.png"
  install -vDm644 barcodeprintersetting.desktop "$pkgdir/usr/share/applications/barcodeprintersetting.desktop"
  sed -i "$pkgdir/usr/share/applications/barcodeprintersetting.desktop" \
    -e 's/Exec=.*/Exec=thermalprinterui/;s/Icon=.*/Icon=thermalprinterui.png/'
}
