# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5200-complete/
# Only tested with x86_64 architecture

pkgname=canon-pixma-mg2500-complete
pkgver=4.00
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MG2500 series (MG2500, MG2540S etc.)"
url='http://www.usa.canon.com/cusa/support/consumer/printers_multifunction/pixma_mg_series/pixma_mg2520_w_pp_201'
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"
if [[ ${CARCH} == 'x86_64' ]]; then
  depends=('popt' 'libpng12' 'libusb-compat' 'libtiff' 'libxml2' 'gtk2')
elif [[ ${CARCH} == 'i686' ]]; then
  depends=('popt' 'lib32-libpng12' 'libusb-compat' 'lib32-libtiff' 'lib32-libxml2' 'gtk2')
fi
makedepends=('deb2targz' 'sed')
source=('http://gdlp01.c-wss.com/gds/2/0100005502/01/cnijfilter-mg2500series-4.00-1-deb.tar.gz'
        'http://gdlp01.c-wss.com/gds/9/0100005519/01/scangearmp-mg2500series-2.20-1-deb.tar.gz')
md5sums=('133593894b4dd9553b0891f92966e9de'
         'e553eadc540b18a6782a3f7d0b7eab80')

_printDrvSrc='cnijfilter-mg2500series-4.00-1-deb'
_scanDrvSrc='scangearmp-mg2500series-2.20-1-deb'


if [[ ${CARCH} == 'x86_64' ]]; then
	_printDrvDebCommon='cnijfilter-common_4.00-1_amd64'
	_printDrvDebMain='cnijfilter-mg2500series_4.00-1_amd64'
	_scanDrvDebCommon='scangearmp-common_2.20-1_amd64'
	_scanDrvDebMain='scangearmp-mg2500series_2.20-1_amd64'
elif [[ ${CARCH} == 'i686' ]]; then
	_printDrvDebCommon='cnijfilter-common_4.00-1_i386'
	_printDrvDebMain='cnijfilter-mg2500series_4.00-1_i386'
	_scanDrvDebCommon='scangearmp-common_2.20-1_i386'
	_scanDrvDebMain='scangearmp-mg2500series_2.20-1_i386'
fi

_ppdFile="canonmg2500.ppd"

build() {
   cd ${srcdir}

   # Unpack driver source files
   tar xvzf ${_printDrvSrc}.tar.gz
   tar xvzf ${_scanDrvSrc}.tar.gz
   rm -v *.tar.gz
}


package() {
   cd ${pkgdir}

  # Unpack debian installer files
   cp "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebCommon}.deb" .
   cp "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebMain}.deb" .
   cp "${srcdir}/${_scanDrvSrc}/packages/${_scanDrvDebCommon}.deb" .
   cp "${srcdir}/${_scanDrvSrc}/packages/${_scanDrvDebMain}.deb" .

   deb2targz "${_printDrvDebCommon}.deb"
   deb2targz "${_printDrvDebMain}.deb"
   deb2targz "${_scanDrvDebCommon}.deb"
   deb2targz "${_scanDrvDebMain}.deb"
   rm -v *.deb

   tar xzvf "${_printDrvDebCommon}.tar.gz"
   tar xzvf "${_printDrvDebMain}.tar.gz"
   tar xzvf "${_scanDrvDebCommon}.tar.gz"
   tar xzvf "${_scanDrvDebMain}.tar.gz"
   rm -v *.tar.gz

   # Move ppd file to where cups expects
   install -vDm 644 "${pkgdir}/usr/share/ppd/${_ppdFile}" "${pkgdir}/usr/share/cups/model/${_ppdFile}"

   rm -vrf ${pkgdir}/usr/share/ppd

   # Fix udev rules
   sed -i -e "s/SYSFS/ATTR/g" "${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules"

   # Install custom license file
install -vDm 644 "$pkgdir/usr/share/doc/cnijfilter-mg2500series/LICENSE-cnijfilter-4.00EN.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
