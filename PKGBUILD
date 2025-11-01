# Maintainer: Shrikant Khare <shrikantkhare <at> gmail <dot> com>
# Based on brother-dcpt735dw by zhdbk

pkgname=brother-dcpt535dw
pkgver=3.6.1
pkgrel=1
pkgdesc="Driver for the Brother DCP-T535DW wifi multifuncional printer"
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpt535dw_eu_as"
license=('custom: Brother License' 'EULA' 'GPL')
arch=('i686' 'x86_64')
optdepends=('sane: scanning support'
            'sane-airscan: SANE backend for AirScan (eSCL) and WSD document scanners'
            'brscan5: making dcpt525w scaner available to sane'
            'brscan-skey: scankey support if connected via usb')

depends=('cups')

source=(
  "https://download.brother.com/welcome/dlf106521/dcpt535dwpdrv-$pkgver-$pkgrel.amd64.deb" \
)
sha256sums=(
  '84106fd5ea07c072ecd12a815bcb9bea4efc02b7cbc29573bec1a96c9516d79d' \
)

prepare() {
    tar xf data.tar.gz
}

package() {

    mv opt/ "${pkgdir}"

    # Create necessary directory structure
    install -d "$pkgdir/usr/lib/cups/filter"
    install -d "$pkgdir/usr/bin"

    # Install PPD file to CUPS model directory
    install -D -m644 "$pkgdir/opt/brother/Printers/dcpt535dw/cupswrapper/brother_dcpt535dw_printer_en.ppd" \
        "$pkgdir/usr/share/cups/model/brother_dcpt535dw_printer_en.ppd"

    # Install license files
    install -D -m644 "$pkgdir/opt/brother/Printers/dcpt535dw/LICENSE_ENG.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
    install -D -m644 "$pkgdir/opt/brother/Printers/dcpt535dw/LICENSE_JPN.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"

    # Create necessary symbolic links to architecture-specific binaries
    if [ "$CARCH" = "x86_64" ]; then
        ln -s /opt/brother/Printers/dcpt535dw/lpd/x86_64/brdcpt535dwfilter \
        "$pkgdir/usr/lib/cups/filter/brdcpt535dw"
        ln -s /opt/brother/Printers/dcpt535dw/lpd/x86_64/brprintconf_dcpt535dw \
        "$pkgdir/usr/bin/brprintconf_dcpt535dw"

    elif [ "$CARCH" = "i686" ]; then
        ln -s /opt/brother/Printers/dcpt535dw/lpd/i686/brdcpt535dwfilter \
        "$pkgdir/usr/lib/cups/filter/brdcpt535dw"
        ln -s /opt/brother/Printers/dcpt535dw/lpd/i686/brprintconf_dcpt535dw \
        "$pkgdir/usr/bin/brprintconf_dcpt535dw"
    fi

    # Install CUPS wrapper script to executable path
    ln -s /opt/brother/Printers/dcpt535dw/cupswrapper/cupswrapperdcpt535dw \
        "$pkgdir/usr/bin/cupswrapperdcpt535dw"

    # FIX: Create missing symbolic link for brother_lpdwrapper_dcpt535dw
    ln -s /opt/brother/Printers/dcpt535dw/cupswrapper/brother_lpdwrapper_dcpt535dw \
        "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_dcpt535dw"
}
