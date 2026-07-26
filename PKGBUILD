# Maintainer: Filip <denuvo at tuta dot io>

pkgname=xprinter-cups
pkgver=3.13.3
pkgrel=1
pkgdesc="Xprinter Drivers for Linux (ESC/POS and TSPL)"
arch=('x86_64')
url="https://www.xprintertech.com/drivers-2"
depends=('cups')
makedepends=('dpkg' 'unrar')
options=('!strip')

source=("${pkgname}-${pkgver}.rar::https://www.xprintertech.com/label-printer-linux-1")
sha256sums=("ed2665af416d83b8622f3f231a7300632251ec4fa98804b675e123e052518cfa")

prepare() {
    local deb_file=("Linux/printer-driver-xprinter_${pkgver}_all.deb")

    cd "$srcdir"
    dpkg -x "${deb_file[0]}" extracted_deb
    mkdir -p prepared_ppds

    for ppd in extracted_deb/usr/share/cups/model/xprinter/*.ppd; do
        chmod 644 "$ppd"
        gzip -9c "$ppd" > "prepared_ppds/${ppd##*/}.gz"
    done
}

package() {
    cd "$srcdir"

    install -dm755 "${pkgdir}/usr/lib/cups/filter"
    install -Dm755 extracted_deb/opt/xprinter/printer-driver-xprinter/bin/rastertosnailep-x64 "${pkgdir}/usr/lib/cups/filter/rastertosnailep-xprinter"
    install -Dm755 extracted_deb/opt/xprinter/printer-driver-xprinter/bin/rastertosnailtspl-x64 "${pkgdir}/usr/lib/cups/filter/rastertosnailtspl-xprinter"
    install -dm755 "${pkgdir}/usr/share/cups/model/xprinter"

    for ppd_gz in prepared_ppds/*.gz; do
        install -Dm644 "$ppd_gz" "${pkgdir}/usr/share/cups/model/xprinter/${ppd_gz##*/}"
    done
}
