# Maintainer: kszonek <aur@kszonek.pl>
# AUR [brother-mfc-j200] package by kszonek <aur@kszonek.pl>
# based on brother-mfc-j220 package

pkgname="brother-mfc-j200"
_model="j200"
pkgver="3.0.0"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J200"
url="http://solutions.brother.com/linux/en_us/"
license=('custom:brother commercial license')

arch=('i686' 'x86_64')

depends=('cups' 'perl' 'bash')
if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

install="$pkgname.install"

source=("http://www.brother.com/pub/bsc/linux/dlf/mfcj200lpr-$pkgver-$pkgrel.i386.rpm"
	"http://www.brother.com/pub/bsc/linux/dlf/mfcj200cupswrapper-$pkgver-$pkgrel.i386.rpm"
)
md5sums=('f2e7c9e3515103ebde415662bbfc79e3'
	 'bcba51ee76ad7e665ee950b8979fb95d'
)

prepare() {
  echo "unpacking"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -m 0755 -o root -g root "${srcdir}/usr/bin/brprintconf_mfcj200" "${pkgdir}/usr/bin/brprintconf_mfcj200"

  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

  mkdir -p "${pkgdir}/usr/lib/cups/filter"
  echo "#! /opt/brother/Printers/mfcj200/lpd/filtermfcj200" > "${srcdir}/filter-shim"
  install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_mfcj200"

  mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
  install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/mfcj200/cupswrapper/brother_mfcj200_printer_en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}
