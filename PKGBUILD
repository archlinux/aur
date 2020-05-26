# Maintainer:  MindLikeWater <mlw att pi dott xelpara dott de>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mx870-complete/
# Scanner icon source: http://openiconlibrary.sourceforge.net/gallery2/open_icon_library-full/icons/png/64x64/devices/scanner-3.png

# Only tested with x86_64 architecture

pkgname=canon-pixma-mg5200-complete
pkgver=3.40
pkgrel=4
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MG5200 series (MG5250 etc.)"
url='http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MG_series/PIXMA_MG5250.aspx'
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"
if [ ${CARCH} = 'x86_64' ]; then
  depends=('lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-libxml2' 'lib32-gtk2' 'cups')
elif [ ${CARCH} = 'i686' ]; then
  depends=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2' 'gtk2' 'cups')
fi
makedepends=('deb2targz' 'sed')
source=('http://files.canon-europe.com/files/soft40259/Software/MG5200series-printer_driver.tar'
         'http://files.canon-europe.com/files/soft40260/Software/MG5200series-scanner_driver.tar'
         "${pkgname}.license"
         "${pkgname}-scangear.desktop"
         "${pkgname}-scangear-icon.png")
md5sums=('5a2bb977ecc659e8e96d8f285b8efc33'
         '2961844d2229e80a74b0d79a83a0c089'
         'd8faf0e75ee3d1989eed39d55cb3e8fb'
         '29ba133e8df0d82182f5f86fbf6f1776'
         '3feefd413092d7152f47b7451ba79efe')

_printDrvSrc='cnijfilter-mg5200series-3.40-1-deb'
_scanDrvSrc='scangearmp-mg5200series-1.60-1-deb'

_printDrvDebCommon='cnijfilter-common_3.40-1_i386'
_printDrvDebMain='cnijfilter-mg5200series_3.40-1_i386'

_scanDrvDebCommon='scangearmp-common_1.60-1_i386'
_scanDrvDebMain='scangearmp-mg5200series_1.60-1_i386'

_ppdFile="canonmg5200.ppd"

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
