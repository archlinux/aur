# Maintainer: Kfftfuftur <aur [at] kfftfuftur [dot] de>

pkgname=brother-dcp-t780dw
pkgver=3.6.1_1
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP-T780DW"
arch=('x86_64')
url="https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=mfcl3780cdw_us_as&os=128&dlid=dlf105764_000&flang=4&type3=10283"
license=('LicenseRef-brother')
depends=('cups' 'ghostscript' 'perl' 'lib32-glibc')
optdepends=('brscan4: scanner support')
_pkgfilename="dcpt780dwpdrv-${pkgver/_/-}.amd64.deb"
source=("https://download.brother.com/welcome/dlf106531/${_pkgfilename}")
sha256sums=('1013896a946f14781e62f8a42b6e219bd0de4ca7e03bbdc28feb9e55329d6026')

package(){
    tar -xaf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
    cd "${pkgdir}/opt/brother/Printers/dcpt780dw"

    # copy cups filters out of architecture-specific directories  (from .deb postinst)
    cp "lpd/x86_64/brdcpt780dwfilter" \
       "lpd/brdcpt780dwfilter"
    cp "lpd/x86_64/brprintconf_dcpt780dw" \
       "lpd/brprintconf_dcpt780dw"
    rm -rf "lpd/i686"
    rm -rf "lpd/x86_64"

    # symlink cupswrapper files
    install -d "${pkgdir}/usr/lib/cups/filter/"
    ln -sf "/opt/brother/Printers/dcpt780dw/cupswrapper/brother_lpdwrapper_dcpt780dw" \
           "${pkgdir}/usr/lib/cups/filter/"

    # symlink cups ppd files
    install -d "${pkgdir}/usr/share/cups/model/"
    ln -sf "/opt/brother/Printers/dcpt780dw/cupswrapper/brother_dcpt780dw_printer_en.ppd" \
           "${pkgdir}/usr/share/cups/model/"

    # install license files
    install -Dm644 LICENSE_ENG.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ENG.txt"
}
