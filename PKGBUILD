# Maintainer: Gabriel Assis <g.assisp <at> protonmail <dot> com>
# Based on brother-dcpt535dw by arcticblaze

pkgname=brother-dcpt530dw
pkgver=3.6.1
pkgrel=1
pkgdesc="Driver for the Brother DCP-T530DW wifi multifuncional printer"
url="https://support.brother.com/g/b/producttop.aspx?c=br&lang=pt&prod=dcpt530dw_us_eu_as"
license=('custom: Brother License' 'EULA' 'GPL')
arch=('i686' 'x86_64')

optdepends=(
    'sane: scanning support'
    'brscan5: making dcpt530dw scanner available to sane'
    'brscan-skey: scankey support if connected via usb'
)

depends=('cups' 'ghostscript')

source=("https://download.brother.com/welcome/dlf106519/dcpt530dwpdrv-${pkgver}-${pkgrel}.amd64.deb")

sha256sums=('5dcd7064194015b3aa7be114bf1c79e84350d4370b75ec93cfd83b4a615597d8')

prepare() {
    tar xf data.tar.gz
}

package() {

    # Create necessary directory structure
    install -d "$pkgdir/usr/lib/cups/filter"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/cups/model"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    # Copy /opt to the package
    cp -a opt "$pkgdir/"

    # Install PPD file to CUPS model directory
    install -D -m644 "$pkgdir/opt/brother/Printers/dcpt530dw/cupswrapper/brother_dcpt530dw_printer_en.ppd" \
        "$pkgdir/usr/share/cups/model/brother_dcpt530dw_printer_en.ppd"

    # Install license files
    install -D -m644 "$pkgdir/opt/brother/Printers/dcpt530dw/LICENSE_ENG.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
    install -D -m644 "$pkgdir/opt/brother/Printers/dcpt530dw/LICENSE_JPN.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"

    # Create necessary symbolic links to architecture-specific binaries
    if [ "$CARCH" = "x86_64" ]; then
        ln -s /opt/brother/Printers/dcpt530dw/lpd/x86_64/brdcpt530dwfilter \
        "$pkgdir/usr/lib/cups/filter/brdcpt530dw"
        ln -s /opt/brother/Printers/dcpt530dw/lpd/x86_64/brprintconf_dcpt530dw \
        "$pkgdir/usr/bin/brprintconf_dcpt530dw"

    elif [ "$CARCH" = "i686" ]; then
        ln -s /opt/brother/Printers/dcpt530dw/lpd/i686/brdcpt530dwfilter \
        "$pkgdir/usr/lib/cups/filter/brdcpt530dw"
        ln -s /opt/brother/Printers/dcpt530dw/lpd/i686/brprintconf_dcpt530dw \
        "$pkgdir/usr/bin/brprintconf_dcpt530dw"
    fi

    # Install CUPS and LPD wrapper script to executable path
    ln -s /opt/brother/Printers/dcpt530dw/cupswrapper/cupswrapperdcpt530dw \
        "$pkgdir/usr/bin/cupswrapperdcpt530dw"

    ln -s /opt/brother/Printers/dcpt530dw/cupswrapper/brother_lpdwrapper_dcpt530dw \
        "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_dcpt530dw"
}
