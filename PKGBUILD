# Maintainer: Franz Rogar <franzrogar@gmail.com>
# Modified AUR [brother-mfc-j220] package by Franz Rogar <franzrogar@gmail.com>
# Original AUR [brother-hll2300d] package maintained by Mykola Bespaliuk (kolkabes [at] gmail [dot] com)
pkgname="brother-mfc-j220"
_model="j220"
pkgver="1.1.3"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J220"
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')

arch=('i686' 'x86_64')

depends=('cups' 'perl' 'bash')
if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

install="$pkgname.install"

source=("http://www.brother.com/pub/bsc/linux/dlf/mfcj220lpr-$pkgver-$pkgrel.i386.rpm"
	"http://www.brother.com/pub/bsc/linux/dlf/mfcj220cupswrapper-$pkgver-$pkgrel.i386.rpm"
)
md5sums=('931b168c320049ae20a1b5939f5da31e'
	 '37bbde153ca2e3ac5005f637ce5a4fbb'
)

prepare() {
echo "unpacking"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -m 0755 -o root -g root "${srcdir}/usr/bin/brprintconf_mfcj220" "${pkgdir}/usr/bin/brprintconf_mfcj220"

  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

  mkdir -p "${pkgdir}/usr/lib/cups/filter"
  echo "#! /opt/brother/Printers/mfcj220/lpd/filtermfcj220" > "${srcdir}/filter-shim"
  install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/filtermfcj220"

  mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
  install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/mfcj220/cupswrapper/brother_mfcj220_printer_en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}
