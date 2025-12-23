# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=brother-mfc-l3740cdw
pkgver=3.5.1_1
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L3740CDW"
arch=('x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=mfcl3740cdw_eu"
license=('LicenseRef-brother')
depends=('cups' 'ghostscript' 'perl' 'glibc' 'gcc-libs' 'bash')
optdepends=('brscan4: scanner support')
_pkgfilename="mfcl3740cdwpdrv-${pkgver/_/-}.i386.deb"
source=("https://download.brother.com/welcome/dlf105760/${_pkgfilename}")
sha256sums=('df07a84388c927d8767c89b42c2c96f7263c76fb86112236ebf8ac7668730596')

package(){
    tar -xaf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
    cd "${pkgdir}/opt/brother/Printers/mfcl3740cdw"

    # copy cups filters out of architecture-specific directories  (from .deb postinst)
    cp "lpd/x86_64/brmfcl3740cdwfilter" \
       "lpd/brmfcl3740cdwfilter"
    cp "lpd/x86_64/brprintconf_mfcl3740cdw" \
       "lpd/brprintconf_mfcl3740cdw"
    rm -rf "lpd/i686"
    rm -rf "lpd/x86_64"

    # symlink cupswrapper files
    install -d "${pkgdir}/usr/lib/cups/filter/"
    ln -sf "/opt/brother/Printers/mfcl3740cdw/cupswrapper/brother_lpdwrapper_mfcl3740cdw" \
           "${pkgdir}/usr/lib/cups/filter/"

    # symlink cups ppd files
    install -d "${pkgdir}/usr/share/cups/model/"
    ln -sf "/opt/brother/Printers/mfcl3740cdw/cupswrapper/brother_mfcl3740cdw_printer_en.ppd" \
           "${pkgdir}/usr/share/cups/model/"

    # install license files
    install -Dm644 LICENSE_ENG.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ENG.txt"
}
