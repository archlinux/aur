# Maintainer: Evan M. <nop-90@keemail.me>
# Contributor: Ryan Owens <RyanOwens at linux dot com>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5500-complete
# Scanner icon source: http://openiconlibrary.sourceforge.net/gallery2/open_icon_library-full/icons/png/64x64/devices/scanner-3.png

pkgname=canon-pixma-mg5700-complete
pkgver=5.20
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MG5700 series"
url='https://www.canon-europe.com/printers/inkjet/pixma/pixma_mg5700_series'
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"
depends_x86_64=('lib32-popt' 'lib32-libpng12' 'lib32-libtiff4' 'lib32-libxml2' 'lib32-gtk2')
depends_i686=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2' 'gtk2')

makedepends=('deb2targz' 'sed')
source=('http://gdlp01.c-wss.com/gds/2/0100006902/01/cnijfilter2-5.20-1-deb.tar.gz'
        'http://gdlp01.c-wss.com/gds/5/0100006905/01/scangearmp2-3.20-1-deb.tar.gz'
         "${pkgname}.license"
         "${pkgname}-scangear.desktop"
         "${pkgname}-scangear-icon.png")

sha1sums=('9fff089de350b02e4b1e29a39ff54f9ed7a22771'
         '4cf0ab10c1e8b4df13db18c4c1e47b8c643c0fd3'
         'SKIP'
         'SKIP'
         'SKIP')

_printDrvSrc='cnijfilter2-5.20-1-deb'
_scanDrvSrc='scangearmp2-3.20-1-deb'

_printDrvDebMain="cnijfilter2_5.20-1_amd64"
_scanDrvDebMain="scangearmp2_3.20-1_amd64"

_ppdFile="canonmg5700.ppd"

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

   cp "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebMain}.deb" .
   cp "${srcdir}/${_scanDrvSrc}/packages/${_scanDrvDebMain}.deb" .

   deb2targz "${_printDrvDebMain}.deb"
   deb2targz "${_scanDrvDebMain}.deb"

   rm -v *.deb

   tar xzvf "${_printDrvDebMain}.tar.gz"
   tar xzvf "${_scanDrvDebMain}.tar.gz"

   rm -v *.tar.gz

   # Move ppd file to where cups expects

   install -vDm 644 "${pkgdir}/usr/share/ppd/${_ppdFile}" "${pkgdir}/usr/share/cups/model/${_ppdFile}"

   rm -vrf ${pkgdir}/usr/share/ppd

   # Fix udev rules

   sed -i -e "s/SYSFS/ATTR/g" "${pkgdir}/etc/udev/rules.d/80-canon_mfp2.rules"

   # Install custom license file

   install -vDm 644 "${srcdir}/${pkgname}.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   
   # Install entry in application menu, including icon

   install -vDm 644 "${srcdir}/${pkgname}-scangear.desktop" "${pkgdir}/usr/share/applications/${pkgname}-scangear.desktop"
   install -vDm 644 "${srcdir}/${pkgname}-scangear-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-scangear-icon.png"
}
