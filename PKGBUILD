# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>
# Contributor: Oleksandr Natalenko <pfactum [at] gmail [dot] com>
# Contributor: Igor Mosyagin <c6h10o5 [at] gmail [dot] com>

pkgname=brother-mfc-7860dw
pkgver=2.1.0
_wrapper_ver=2.0.4
pkgrel=4
pkgdesc="LPR and CUPSwrapper driver for the Brother MFC-7860DW."
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/producttop.aspx?c=us_ot&lang=en&prod=mfc7860dw_all"
license=('GPL')
depends=()
if [ "$CARCH" = "x86_64" ]; then
    depends=('cups' 'ghostscript' 'gsfonts' 'cups-filters' 'lib32-glibc')
else
    depends=('cups' 'ghostscript' 'gsfonts' 'cups-filters')
fi
source=(http://www.brother.com/pub/bsc/linux/dlf/mfc7860dwlpr-${pkgver}-1.i386.rpm
        http://www.brother.com/pub/bsc/linux/dlf/cupswrapperMFC7860DW-${_wrapper_ver}-2.i386.rpm
        brother-mfc-7860dw.patch)
sha256sums=('7886fbbaa9aa980d6f6b08f4a584f8614857e6ab1511c2b494d3b8e1dedafd14'
            '2ab019790bd88b65b592b1a700f9e96018130bcbfc19cde5017f0230e7f77e98'
            '1123ca4599d8404fee800d5f439ad862ff4ad49d252fca527c170d9500d8a7f3')

prepare() {
  # Modify file locations to align with packaging standards for Arch Linux systems and tame the wrapper.
  patch -p1 < "${srcdir}/brother-mfc-7860dw.patch" || return 1
}

build() {
  sh "${srcdir}/usr/local/Brother/Printer/MFC7860DW/cupswrapper/cupswrapperMFC7860DW-${_wrapper_ver}"
}

package() {
  mkdir -p "${pkgdir}/usr/share/brother"
  cp -r "${srcdir}/usr/local/Brother/Printer" "${pkgdir}/usr/share/brother/printer"
  cp -r "${srcdir}/var" "${pkgdir}/"

  rm "${pkgdir}/usr/share/brother/printer/MFC7860DW/cupswrapper/cupswrapperMFC7860DW-${_wrapper_ver}"
  rm "${pkgdir}/usr/share/brother/printer/MFC7860DW/inf/setupPrintcap2"

  install -m 644 -D ppd_file "${pkgdir}/usr/share/cups/model/MFC7860DW.ppd"
  install -m 755 -D wrapper  "${pkgdir}/usr/lib/cups/filter/brlpdwrapperMFC7860DW"
}
