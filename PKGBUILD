# Maintainer:  Ryan Owens <RyanOwens at linux dot com>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5200-complete
# Scanner icon source: http://openiconlibrary.sourceforge.net/gallery2/open_icon_library-full/icons/png/64x64/devices/scanner-3.png

pkgname=canon-pixma-mg5500-complete
pkgver=4.00
pkgrel=2
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MG5500 series"
url='http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MG_series/PIXMA_MG5540.aspx'
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"
depends_x86_64=('lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-libxml2' 'lib32-gtk2')
depends_i686=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2' 'gtk2')

makedepends=('deb2targz' 'sed')
source=('http://gdlp01.c-wss.com/gds/6/0100005506/01/cnijfilter-mg5500series-4.00-1-deb.tar.gz'
         'http://gdlp01.c-wss.com/gds/3/0100005523/01/scangearmp-mg5500series-2.20-1-deb.tar.gz'
         "${pkgname}.license"
         "${pkgname}-scangear.desktop"
         "${pkgname}-scangear-icon.png")
md5sums=('f1163d22c0a6d869120b90900fd1a640'
         'e96527b7401c291e22e4bd85ded9caac'
         'd8faf0e75ee3d1989eed39d55cb3e8fb'
         '26ebae4fc269fa9d3efa56373345921f'
         '3feefd413092d7152f47b7451ba79efe')

_printDrvSrc='cnijfilter-mg5500series-4.00-1-deb'
_scanDrvSrc='scangearmp-mg5500series-2.20-1-deb'

_printDrvDebCommon='cnijfilter-common_4.00-1_i386'
_printDrvDebMain='cnijfilter-mg5500series_4.00-1_i386'

_scanDrvDebCommon='scangearmp-common_2.20-1_i386'
_scanDrvDebMain='scangearmp-mg5500series_2.20-1_i386'

_ppdFile="canonmg5500.ppd"

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
