# Maintainer: Victor Trac <victor.trac@gmail.com>
pkgname=brother-mfcj1170dw-cups-bin
pkgver=3.5.0
pkgrel=1
pkgdesc="Brother MFC-J1170DW printer driver for CUPS"
arch=('x86_64' 'i686')
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcj1170dw_us"
license=('GPL2')
depends=('cups' 'perl' 'ghostscript')
source=("https://download.brother.com/welcome/dlf105360/mfcj1170dwpdrv-${pkgver}-1.i386.deb")
sha256sums=('c396746c909c6f3222ea1d549801f7f17a4bd6f8217b2c1d1f464929508c32a1')

package() {
    # Extract data from the deb package
    bsdtar -xf data.tar.gz -C "${pkgdir}"

    # Install PPD file for CUPS
    install -d "${pkgdir}/usr/share/cups/model/Brother"
    install -m 644 \
        "${pkgdir}/opt/brother/Printers/mfcj1170dw/cupswrapper/brother_mfcj1170dw_printer_en.ppd" \
        "${pkgdir}/usr/share/cups/model/Brother/"

    # Symlink the CUPS filter wrapper
    install -d "${pkgdir}/usr/lib/cups/filter"
    ln -s /opt/brother/Printers/mfcj1170dw/cupswrapper/brother_lpdwrapper_mfcj1170dw \
        "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcj1170dw"

    # Symlink arch-appropriate binaries to where the filter script expects them
    local _lpddir="${pkgdir}/opt/brother/Printers/mfcj1170dw/lpd"
    if [ "${CARCH}" = "x86_64" ]; then
        ln -s x86_64/brmfcj1170dwfilter "${_lpddir}/brmfcj1170dwfilter"
        ln -s x86_64/brprintconf_mfcj1170dw "${_lpddir}/brprintconf_mfcj1170dw"
        rm -rf "${_lpddir}/i686"
    else
        ln -s i686/brmfcj1170dwfilter "${_lpddir}/brmfcj1170dwfilter"
        ln -s i686/brprintconf_mfcj1170dw "${_lpddir}/brprintconf_mfcj1170dw"
        rm -rf "${_lpddir}/x86_64"
    fi
}
