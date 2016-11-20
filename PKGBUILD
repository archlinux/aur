# Maintainer: Oleksandr Natalenko <pfactum@gmail.com>
# Author of original PKGBUILD: Igor Mosyagin <c6h10o5@gmail.com>
pkgname=brother-mfc-7860dw
pkgver=2.1.0
_driver_ver=2.1.0
_wrapper_ver=2.0.4
pkgrel=3
pkgdesc="CUPS driver for Brother MFC-7860DW printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL')
depends=()
if [ "$CARCH" = "x86_64" ]; then
    depends=('cups' 'ghostscript' 'gsfonts' 'foomatic-filters' 'lib32-glibc')
else
    depends=('cups' 'ghostscript' 'gsfonts' 'foomatic-filters')
fi
install=brother-mfc-7860dw.install
source=(http://www.brother.com/pub/bsc/linux/dlf/mfc7860dwlpr-${_driver_ver}-1.i386.rpm
        http://www.brother.com/pub/bsc/linux/dlf/cupswrapperMFC7860DW-${_wrapper_ver}-2.i386.rpm
        brother-mfc-7860dw.patch)
sha256sums=('7886fbbaa9aa980d6f6b08f4a584f8614857e6ab1511c2b494d3b8e1dedafd14'
            '2ab019790bd88b65b592b1a700f9e96018130bcbfc19cde5017f0230e7f77e98'
            'a20a9c1f537b18593eab3a8274a9a78cf5c00d29faf63c22737dc302d9b7e441')

prepare() {
  cd "${srcdir}"

  # patch files to adhere arch packaging standard
  patch -p1 < "${srcdir}/brother-mfc-7860dw.patch" || return 1
}

build() {
  cd "${srcdir}"

  # generate ppd and wrapper file
  sh "${srcdir}/usr/local/Brother/Printer/MFC7860DW/cupswrapper/cupswrapperMFC7860DW-${_wrapper_ver}"
}

package() {
  # put files where they belong
  mkdir -p "${pkgdir}/usr/share/brother"
  cp -r "${srcdir}/usr/local/Brother/Printer" "${pkgdir}/usr/share/brother/printer"
  cp -r "${srcdir}/var" "${pkgdir}/"

  rm "${pkgdir}/usr/share/brother/printer/MFC7860DW/cupswrapper/cupswrapperMFC7860DW-${_wrapper_ver}"
  rm "${pkgdir}/usr/share/brother/printer/MFC7860DW/inf/setupPrintcap2"

  install -m 644 -D ppd_file "${pkgdir}/usr/share/cups/model/MFC7860DW.ppd"
  install -m 755 -D wrapper  "${pkgdir}/usr/lib/cups/filter/brlpdwrapperMFC7860DW"
}

