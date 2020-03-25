# Maintainer: Matthew Carr <mdcarr941 at gmail>

# This package is a trivial modification of
# https://aur.archlinux.org/packages/canon-pixma-# ts5055-complete/
# which is maintained by Malte Ohmstede.
# Scanner icon source: http://openiconlibrary.sourceforge.net/gallery2/open_icon_library-full/icons/png/64x64/devices/scanner-3.png
# The icon source URL isn't alive anymore

pkgname=canon-maxify-mb5100-complete
pkgver=5.40
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon maxify MB5100 series."
url='https://www.usa.canon.com/internet/portal/us/home/support/details/printers/small-office-home-office-printers/mb5120'
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

sha256sums=('3b298716ad8b806fad72ed52714838921dea6f84253446a02d0e669afbc13804'
            'bb8d108b2c3557f3dc258d47b560ce96608a006ec7b052a630e0a5f911da2413'
            '3acb5003d7d2b71bf2ecf9d9cd57872f20b182ab0df5e9d5528649f5fbd391c0'
            '29dbc682d3f22d79f580bda54801d1f4ef261d857c756eaf4db29e1313406bcc')

_printDrvSrc='cnijfilter2-5.40-1-deb'
_scanDrvSrc='scangearmp2-3.40-1-deb'

_ppdFile="canonmb5100.ppd"

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
