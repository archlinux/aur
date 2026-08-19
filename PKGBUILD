# Maintainer: Borislav Borisov <borislav.borisov@yahoo.com>

pkgname=hll5210dwpdrv
pkgver=4.0.3
pkgrel=1
pkgdesc="Brother HL-L5210DW CUPS printer driver"
arch=('x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=us_ot&lang=en&prod=hll5210dw_us_eu_as"
license=('custom')
depends=('cups' 'perl')
options=('!debug')

_debrel=2
_deb="${pkgname}-${pkgver}-${_debrel}.i386.deb"

source=("https://download.brother.com/welcome/dlf105786/${_deb}")
sha256sums=('e826f47b0b261eb20047a64ec9e506f0ad9e67187cff21a76e1924ddaf293f48')

package() {
    cd "$srcdir"

    # Extract Debian package
    bsdtar -xf "$_deb"

    # Extract filesystem payload
    bsdtar -xJf data.tar.xz -C "$pkgdir"

    # Keep only the native architecture binaries
    rm -rf "$pkgdir/opt/brother/Printers/HLL5210DW/lpd/i686"

    # Remove Debian/LPR-specific setup helper
    rm -f "$pkgdir/opt/brother/Printers/HLL5210DW/inf/setupPrintcap"

    # Remove unused spool directory
    rm -rf "$pkgdir/var"

    # Select native binaries
    ln -sf \
        "$CARCH/rawtobr3" \
        "$pkgdir/opt/brother/Printers/HLL5210DW/lpd/rawtobr3"

    ln -sf \
        "$CARCH/brprintconflsr3" \
        "$pkgdir/opt/brother/Printers/HLL5210DW/lpd/brprintconflsr3"

    # Driver configuration links
    ln -sf \
        /opt/brother/Printers/HLL5210DW/inf/brHLL5210DWrc \
        "$pkgdir/etc/opt/brother/Printers/HLL5210DW/inf/brHLL5210DWrc"

    ln -sf \
        /opt/brother/Printers/HLL5210DW/inf/brHLL5210DWrc \
        "$pkgdir/opt/brother/Printers/HLL5210DW/lpd/inf/brHLL5210DWrc"

    # CUPS filter
    install -dm755 "$pkgdir/usr/lib/cups/filter"

    ln -sf \
        /opt/brother/Printers/HLL5210DW/cupswrapper/lpdwrapper \
        "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL5210DW"

    # CUPS PPD
    install -dm755 "$pkgdir/usr/share/cups/model"

    ln -sf \
        /opt/brother/Printers/HLL5210DW/cupswrapper/brother-HLL5210DW-cups-en.ppd \
        "$pkgdir/usr/share/cups/model/brother-HLL5210DW-cups-en.ppd"

    # License
    install -Dm644 \
        "$pkgdir/opt/brother/Printers/HLL5210DW/LICENSE_ENG.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
