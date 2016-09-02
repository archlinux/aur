# Maintainer: DetMittens <adunn dot preston at gmail dot com>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5200-complete/
pkgname=cnijfilter-mp495-x86_64
pkgver=3.40
pkgrel=3
pkgdesc="mp495 cups driver"
arch=('i686' 'x86_64')
install="${pkgname}.install"
license=('custom')
url='https://www.canon.co.uk/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mp_series/pixma_mp495.aspx'
if [[ ${CARCH} = 'x86_64' ]]; then
  depends=('lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-libxml2'  'cups')
elif [[ ${CARCH} = 'i686' ]]; then
  depends=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2'  'cups')
fi
makedepends=('deb2targz' 'sed')
source=('http://files.canon-europe.com/files/soft40269/Software/MP495series_printer_driver.tar'
               'cnijfilter-mp495-x86_64.license' 
                'cnijfilter-mp495-x86_64.install' )
md5sums=( '4d5b9d3d5acc27301344099ecd74fbdc'
                    'e114ed28742dbf2dd7e9fdd24fc80b20'
                    'aa78698dcc53319ea89fa90f81d40bb2' )

_printDrvSrc='cnijfilter-mp495series-3.40-1-deb'

_printDrvDebCommon='cnijfilter-common_3.40-1_i386'
_printDrvDebMain='cnijfilter-mp495series_3.40-1_i386'

_ppdFile='canonmp495.ppd'

build() {
    cd ${srcdir}
    
    tar xvzf ${_printDrvSrc}.tar.gz
    rm -v *.tar.gz
}

package() {
    cd ${pkgdir}
    
    cp "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebCommon}.deb" .
    cp "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebMain}.deb" .
    
    deb2targz "${_printDrvDebCommon}.deb"
    deb2targz "${_printDrvDebMain}.deb"
    
    rm -v *.deb
    
    tar xvzf "${_printDrvDebCommon}.tar.gz"
    tar xvzf "${_printDrvDebMain}.tar.gz"
    
    rm -v *.tar.gz
    
    install -vDm 644 "${pkgdir}/usr/share/ppd/${_ppdFile}" "${pkgdir}/usr/share/cups/model/${_ppdFile}"
    
    rm -vrf "${pkgdir}/usr/share/ppd"
    
    install -vDm 644 "${srcdir}/${pkgname}.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
