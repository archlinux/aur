# Maintainer: Malte Ohmstede <malte.ohmstede at gmail youknow>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5500-complete
# Scanner icon source: http://openiconlibrary.sourceforge.net/gallery2/open_icon_library-full/icons/png/64x64/devices/scanner-3.png
# The icon source URL isn't alive anymore

pkgname=canon-pixma-ts5055-complete
pkgver=5.40
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma TS5055"
url='https://www.canon.de/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_ts_series/pixma-ts5055.html'
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"
if [[ ${CARCH} == 'x86_64' ]]; then
  depends=('popt' 'libpng12' 'libusb-compat' 'libtiff' 'libxml2' 'gtk2')
  _printDrvDebCommon='cnijfilter2_5.40-1_amd64'
  _scanDrvDebCommon='scangearmp2_3.40-1_amd64'
elif [[ ${CARCH} == 'i686' ]]; then
  depends=('popt' 'lib32-libpng12' 'libusb-compat' 'lib32-libtiff' 'lib32-libxml2' 'gtk2')
  _printDrvDebCommon='cnijfilter2_5.40-1_i386'
  _scanDrvDebCommon='scangearmp2_3.40-1_i386'
fi
makedepends=('deb2targz' 'sed')
source=('http://gdlp01.c-wss.com/gds/9/0100008399/01/cnijfilter2-5.40-1-deb.tar.gz'
	'http://gdlp01.c-wss.com/gds/2/0100008402/01/scangearmp2-3.40-1-deb.tar.gz'
        "${pkgname}-scangear.desktop"
        "${pkgname}-scangear-icon.png")

md5sums=('9fde0c1def36fbd38b4d08cd22a2b7a8'
         '833f71781ba733fec84f4eb06d468fb4'
         '149560a4ef6a661611e12fafe828093b'
         '3feefd413092d7152f47b7451ba79efe')

_printDrvSrc='cnijfilter2-5.40-1-deb'
_scanDrvSrc='scangearmp2-3.40-1-deb'

_ppdFile="canonts5000.ppd"

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
   cp "${srcdir}/${_scanDrvSrc}/packages/${_scanDrvDebCommon}.deb" .

   deb2targz "${_printDrvDebCommon}.deb"
   deb2targz "${_scanDrvDebCommon}.deb"

   rm -v *.deb

   tar xzvf "${_printDrvDebCommon}.tar.gz"
   tar xzvf "${_scanDrvDebCommon}.tar.gz"

   rm -v *.tar.gz

   # Move ppd file to where cups expects

   install -vDm 644 "${pkgdir}/usr/share/ppd/${_ppdFile}" "${pkgdir}/usr/share/cups/model/${_ppdFile}"

   rm -vrf ${pkgdir}/usr/share/ppd

   # Install license files

   find ${pkgdir}/usr/share/doc/ -name 'LICENSE*' -execdir install -vDm 644 {} "${pkgdir}/usr/share/licenses/${pkgname}/{}" \;
   
   # Install entry in application menu, including icon

   install -vDm 644 "${srcdir}/${pkgname}-scangear.desktop" "${pkgdir}/usr/share/applications/${pkgname}-scangear.desktop"
   install -vDm 644 "${srcdir}/${pkgname}-scangear-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-scangear-icon.png"
}
