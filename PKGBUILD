# Maintainer: Matt Braddock <mattbraddock AT gmail DOT com>

pkgname=brother-mfc-l3720cdw
pkgver=3.5.1_1
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L3720CDW"
arch=('x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcl3720cdw_us_as"
license=('LicenseRef-brother')
depends=('cups' 'ghostscript' 'perl' 'glibc' 'gcc-libs' 'bash')
optdepends=('brscan4: scanner support')
_pkgfilename="mfcl3720cdwpdrv-${pkgver/_/-}.i386.deb"
source=("https://download.brother.com/welcome/dlf105759/${_pkgfilename}")
sha256sums=('644eb1af997105c20309b2a3cd82f3509d2b1b95e7d772607ae3cebb60a7ee49')

package(){
    tar -xaf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
    cd "${pkgdir}/opt/brother/Printers/mfcl3720cdw"

    # copy cups filters out of architecture-specific directories  (from .deb postinst)
    cp "lpd/x86_64/brmfcl3720cdwfilter" \
       "lpd/brmfcl3720cdwfilter"
    cp "lpd/x86_64/brprintconf_mfcl3720cdw" \
       "lpd/brprintconf_mfcl3720cdw"
    rm -rf "lpd/i686"
    rm -rf "lpd/x86_64"

    # symlink cupswrapper files
    install -d "${pkgdir}/usr/lib/cups/filter/"
    ln -sf "/opt/brother/Printers/mfcl3720cdw/cupswrapper/brother_lpdwrapper_mfcl3720cdw" \
           "${pkgdir}/usr/lib/cups/filter/"

    # symlink cups ppd files
    install -d "${pkgdir}/usr/share/cups/model/"
    ln -sf "/opt/brother/Printers/mfcl3720cdw/cupswrapper/brother_mfcl3720cdw_printer_en.ppd" \
           "${pkgdir}/usr/share/cups/model/"

    # install license files
    install -Dm644 LICENSE_ENG.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ENG.txt"
}
