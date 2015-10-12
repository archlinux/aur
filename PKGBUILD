# Maintainer:  Adrian Gabor (Adriannho)  <raziel_theripper dott com>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5200-complete/
# Scanner icon source: http://pngimg.com/upload/small/printer_PNG7725.png

# Only tested with x86_64 architecture

pkgname=canon-pixma-mg2200-complete
pkgver=3.80
pkgrel=2
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MG2200 series (MG2200, 2250 etc.)"
url='http://www.usa.canon.com/cusa/support/consumer/printers_multifunction/pixma_mg_series/pixma_mg2220_w_pp_201'
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"
if [ ${CARCH} = 'x86_64' ]; then
  depends=('popt' 'libpng12' 'libusb-compat' 'libtiff' 'libxml2' 'gtk2')
elif [ ${CARCH} = 'i686' ]; then
  depends=('popt' 'lib32-libpng12' 'libusb-compat' 'lib32-libtiff' 'lib32-libxml2' 'gtk2')
fi
makedepends=('deb2targz' 'sed')
source=('http://gdlp01.c-wss.com/gds/2/0100004662/01/cnijfilter-mg2200series-3.80-1-deb.tar.gz'
        'http://gdlp01.c-wss.com/gds/7/0100004697/01/scangearmp-mg2200series-2.00-1-deb.tar.gz'
         "${pkgname}.license"
         "${pkgname}-scangear.desktop"
         "${pkgname}-scangear-icon.png")
md5sums=('b534e773d331bf7b5b684e8cc4fb0eb4'
         'b3a8904adcd6a5dc3e2854cb88bf889f'
         'e72a997161bbad213eed9cd768547d58'
         'db1f78308040bc198068d32b4fea573c'
         '64a488a98344b2c8a07f4125361a1987')

_printDrvSrc='cnijfilter-mg2200series-3.80-1-deb'
_scanDrvSrc='scangearmp-mg2200series-2.00-1-deb'


if [ ${CARCH} = 'x86_64' ]; then
  
	_printDrvDebCommon='cnijfilter-common_3.80-1_amd64'
	_printDrvDebMain='cnijfilter-mg2200series_3.80-1_amd64'

	_scanDrvDebCommon='scangearmp-common_2.00-1_amd64'
	_scanDrvDebMain='scangearmp-mg2200series_2.00-1_amd64'

elif [ ${CARCH} = 'i686' ]; then

	_printDrvDebCommon='cnijfilter-common_3.80-1_i386'
	_printDrvDebMain='cnijfilter-mg2200series_3.80-1_i386'

	_scanDrvDebCommon='scangearmp-common_2.00-1_i386'
	_scanDrvDebMain='scangearmp-mg2200series_2.00-1_i386'
fi

_ppdFile="canonmg2200.ppd"

build(){
   cd ${srcdir}

   # Unpack driver source files

   tar xvzf ${_printDrvSrc}.tar.gz
   tar xvzf ${_scanDrvSrc}.tar.gz

   rm -v *.tar.gz
}


package(){
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
install -vDm 644 "${srcdir}/${pkgname}.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   
   # Install entry in application menu, including icon

   install -vDm 644 "${srcdir}/${pkgname}-scangear.desktop" "${pkgdir}/usr/share/applications/${pkgname}-scangear.desktop"
   install -vDm 644 "${srcdir}/${pkgname}-scangear-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-scangear-icon.png"
}
