# Maintainer: sdw113322 <sdw113322@gmail.com>
# Original AUR [brother-mfc-j220] package by Franz Rogar <franzrogar@gmail.com>
# Original AUR [brother-mfc-j220] package maintained by auruser <>
# Original AUR [brother-hll2300d] package maintained by Mykola Bespaliuk (kolkabes [at] gmail [dot] com)
pkgname="brother-mfc-255cw"
_model="255cw"
pkgver="1.1.3"
pkgrel=3
source_pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-255CW"
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')

arch=('i686' 'x86_64')

depends=('cups' 'perl' 'bash' 'ghostscript')
if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

install="$pkgname.install"

source=("http://www.brother.com/pub/bsc/linux/dlf/mfc255cwlpr-$pkgver-$source_pkgrel.i386.rpm"
	"http://www.brother.com/pub/bsc/linux/dlf/mfc255cwcupswrapper-$pkgver-$source_pkgrel.i386.rpm"
)
md5sums=('e36d4a5cebc93b95e2699e82737b25b3'
	 '5e6196f096a8bf915efbcb183e53c117'
)

prepare() {
echo "unpacking"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -m 0755 -o root -g root "${srcdir}/usr/bin/brprintconf_mfc255cw" "${pkgdir}/usr/bin/brprintconf_mfc255cw"

  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

  mkdir -p "${pkgdir}/usr/lib/cups/filter"
  echo "#! /opt/brother/Printers/mfc255cw/lpd/filtermfc255cw" > "${srcdir}/filter-shim"
  install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/brlpdwrappermfc255cw"

  mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
  install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/mfc255cw/cupswrapper/brother_mfc255cw_printer_en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}
