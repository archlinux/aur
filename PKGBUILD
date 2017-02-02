# Maintainer:  Dzon Kosto <johnypean at gmail dot com>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg6300-complete

pkgname=canon-pixma-ip7200-printer
pkgver=3.80
pkgrel=1
pkgdesc="Complete stand alone driver for Canon Pixma IP7200 series"
url='http://www.canon-europe.com/printers/inkjet/pixma/pixma_ip7250/'
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"
depends_x86_64=('lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-libxml2' 'lib32-gtk2')
depends_i686=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2' 'gtk2')

makedepends=('deb2targz' 'sed')
source=("cnijfilter-ip7200series-${pkgver}-${pkgrel}-deb.tar.gz::http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNDY1NTAx"
         "${pkgname}.license")
md5sums=('02724e8cd782545257ce3416aee65c72'
         'd8faf0e75ee3d1989eed39d55cb3e8fb')

_printDrvSrc="cnijfilter-ip7200series-${pkgver}-${pkgrel}-deb"

_printDrvDebCommon="cnijfilter-common_${pkgver}-${pkgrel}_i386"
_printDrvDebMain="cnijfilter-ip7200series_${pkgver}-${pkgrel}_i386"

_ppdFile="canonip7200.ppd"

build(){
   cd ${srcdir}

   # Unpack driver source files

   tar xvzf ${_printDrvSrc}.tar.gz

   rm -v *.tar.gz
}

package(){
   cd ${pkgdir}

   # Unpack debian installer files

   cp "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebCommon}.deb" .
   cp "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebMain}.deb" .

   deb2targz "${_printDrvDebCommon}.deb"
   deb2targz "${_printDrvDebMain}.deb"

   rm -v *.deb

   tar xzvf "${_printDrvDebCommon}.tar.gz"
   tar xzvf "${_printDrvDebMain}.tar.gz"

   rm -v *.tar.gz

   # Move ppd file to where cups expects

   install -vDm 644 "${pkgdir}/usr/share/ppd/${_ppdFile}" "${pkgdir}/usr/share/cups/model/${_ppdFile}"

   rm -vrf ${pkgdir}/usr/share/ppd

   # Install custom license file

   install -vDm 644 "${srcdir}/${pkgname}.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   
}

