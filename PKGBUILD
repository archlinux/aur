# Maintainer:  David Verelst <david punktum verelst at gmail dot com>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5200-complete
# Scanner icon source: http://openiconlibrary.sourceforge.net/gallery2/open_icon_library-full/icons/png/64x64/devices/scanner-3.png

pkgname=canon-pixma-mg6100-complete
pkgver=3.40
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MG6100 series"
url='http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MG_series/PIXMA_MG6350.aspx'
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"
depends_x86_64=('lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-libxml2' 'lib32-gtk2')
depends_i686=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2' 'gtk2')

makedepends=('deb2targz' 'sed')

# download link found at: 
# https://www.canon-europe.com/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mg_series/pixma_mg6150.aspx?type=drivers&language=EN&os=Linux%20(64-bit)
source=('http://files.canon-europe.com/files/soft40261/Software/MG6100series-printer_driver.tar'
        'http://files.canon-europe.com/files/soft40264/Software/MG6100series-scanner_driver.tar'
        "${pkgname}.license"
        "${pkgname}-scangear.desktop"
        "${pkgname}-scangear-icon.png")
md5sums=('c2f392ccc1dd18ad9117c89a4775b4d6'
         '955482838b658333bb224c47dd7bd268'
         'd8faf0e75ee3d1989eed39d55cb3e8fb'
         'fe2f73b5004130608faa993bd9ca2294'
         '3feefd413092d7152f47b7451ba79efe')

_series='6100'
_printDrvSrc='cnijfilter-mg6100series-3.40-1-deb'
_scanDrvSrc='scangearmp-mg6100series-1.60-1-deb'

_printDrvDebCommon='cnijfilter-common_3.40-1_i386'
_printDrvDebMain='cnijfilter-mg6100series_3.40-1_i386'

_scanDrvDebCommon='scangearmp-common_1.60-1_i386'
_scanDrvDebMain='scangearmp-mg6100series_1.60-1_i386'

_ppdFile="canonmg${_series}.ppd"

build(){
   cd ${srcdir}

   # Unpack driver source files

   tar xf MG${_series}series-printer_driver.tar
   tar xf MG${_series}series-scanner_driver.tar

   tar xvzf ${_printDrvSrc}.tar.gz
   tar xvzf ${_scanDrvSrc}.tar.gz

   rm -v *.tar.*
   rm -v *.tar
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

