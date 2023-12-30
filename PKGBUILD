# Maintainer: Denis Tikhomirov <dvtikhomirov at gmail>

pkgname=brother-dcpl2620dw
pkgver=4.1.0_1
pkgrel=1
pkgdesc="CUPS and LPR drivers for the Brother DCP-L2620DW"
arch=("x86_64" "i686")
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcpl2620dw_eu"
license=('GPL-2.0-only' 'custom:Brother EULA')
depends=("cups" "perl")
install="${pkgname}.install"
source=(
    "fix-setupPrintcap.diff"
    "brprintconflsr3_DCPL2620DW"
    "https://download.brother.com/welcome/dlf106011/dcpl2620dwpdrv-${pkgver/_/-}.i386.rpm"
)
sha256sums=(
    "7a30601ab333104caecef2ee71dab2874641c3fa3e2e8e9442a0a6522b4fc1a6"
    "773166df20f1d2b72c3dceb93da9f359e3ec0023fc240a9e494c2a5141e073ef"
    "d7e86191c654cd4e4138766bf20bde955c07a41ec8e975553c86783a15145a7c"
)

prepare() {
    cd "${srcdir}"
    patch -Np0 < fix-setupPrintcap.diff
}

package() {
    cp -R "${srcdir}/opt" "${pkgdir}/opt"
    local printer_dir="/opt/brother/Printers/DCPL2620DW"

    mv "${pkgdir}/${printer_dir}/lpd/${arch}/"* "${pkgdir}/${printer_dir}/lpd"
    rm -r "${pkgdir}/${printer_dir}/lpd/x86_64"
    rm -r "${pkgdir}/${printer_dir}/lpd/i686"
    ln -s "${printer_dir}/inf/brDCPL2620DWrc" "${pkgdir}/${printer_dir}/lpd/inf/brDCPL2620DWrc"

    install -d "${pkgdir}/usr/lib/cups/filter"
    ln -s "${printer_dir}/cupswrapper/lpdwrapper" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2620DW"
    install -d "${pkgdir}/usr/share/cups/model"
    ln -s "${printer_dir}/cupswrapper/brother-DCPL2620DW-cups-en.ppd" "${pkgdir}/usr/share/cups/model"

    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/brprintconflsr3_DCPL2620DW" "${pkgdir}"/usr/bin/
}
