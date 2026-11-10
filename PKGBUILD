# Maintainer: Filip <denuvo at tuta dot io>

pkgname=xprinter-cups
pkgver=3.13.26
pkgrel=1
pkgdesc="Xprinter Drivers for Linux (ESC/POS and TSPL)"
arch=('x86_64')
url="https://www.xprintertech.com/download.html"
depends=('cups')
makedepends=('dpkg')
options=('!strip')

source=("${pkgname}-${pkgver}.deb::https://github.com/hotline1337/aur/raw/refs/heads/main/xprinter-cups/printer-driver-xprinter_3.13.26_all.deb")
b2sums=('928f1c12140bb6b4441f287c34556ead0312033c94862bd9c85bd2795bbc60cdb43bdaf1c0b3018a410094ad50315713c13620d9b1ad410b941e67cb1d663bb6')

prepare() {
    cd "$srcdir"
    dpkg -x "${source[0]%%::*}" extracted_deb
    mkdir -p prepared_ppds

    for ppd in extracted_deb/usr/share/cups/model/xprinter/*.ppd; do
        chmod 644 "$ppd"
        gzip -9c "$ppd" > "prepared_ppds/${ppd##*/}.gz"
    done
}

package() {
    cd "$srcdir"

    install -dm755 "${pkgdir}/usr/lib/cups/filter"
    install -Dm755 extracted_deb/opt/xprinter_printer/printer-driver-xprinter/bin/rastertosnailep-x64 "${pkgdir}/usr/lib/cups/filter/rastertosnailep-xprinter"
    install -Dm755 extracted_deb/opt/xprinter_printer/printer-driver-xprinter/bin/rastertosnailtspl-x64 "${pkgdir}/usr/lib/cups/filter/rastertosnailtspl-xprinter"
    install -dm755 "${pkgdir}/usr/share/cups/model/xprinter"

    for ppd_gz in prepared_ppds/*.gz; do
        install -Dm644 "$ppd_gz" "${pkgdir}/usr/share/cups/model/xprinter/${ppd_gz##*/}"
    done
}
