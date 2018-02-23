# Maintainer: Thibault Boyeux <thibault.boyeux@gmail.com>
# Contributor: DetMittens <adunn dot preston at gmail dot com>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5200-complete/
pkgname=cnijfilter-mp495-x86_64
pkgver=3.40
pkgrel=5
pkgdesc="Canon IJ Printer (MP495 series)"
arch=('x86_64')
install="${pkgname}.install"
license=('custom')
url='https://www.canon.co.uk/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mp_series/pixma_mp495.aspx'
depends=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2'  'cups' 'ghostscript')
conflicts=('cnijfilter-common')
source=('http://files.canon-europe.com/files/soft40269/Software/MP495series_printer_driver.tar'
               'cnijfilter-mp495-x86_64.license' 
                'cnijfilter-mp495-x86_64.install' )
sha256sums=( '3868f50a15bc17df701f34a80c873b4118979dc654a9a6ef5e0d7d44632a6d7f'
                    '398ba51ba7f8459fb9eac43ea9e5b4c89ec89eeea0eb37b6fea1524132280af6'
                    '02d9ab2c0651c62d8d10c6cab4f5014f81ce21c7cb37f53fea43cd7a19b2f1a5' )

_printDrvSrc='cnijfilter-mp495series-3.40-1-deb'

_printDrvDebCommon='cnijfilter-common_3.40-1_amd64'
_printDrvDebMain='cnijfilter-mp495series_3.40-1_amd64'

_ppdFile='canonmp495.ppd'

build() {
    cd ${srcdir}
    
    tar xvzf ${_printDrvSrc}.tar.gz
    rm -v *.tar.gz
}

package() {
    cd ${pkgdir}
    
    cp -v "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebCommon}.deb" .
    cp -v "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebMain}.deb" .
    
    ar p "${_printDrvDebCommon}.deb" data.tar.gz | tar xvz
    ar p "${_printDrvDebMain}.deb" data.tar.gz | tar xvz
    
    rm -v *.deb
    
    install -vDm 644 "${pkgdir}/usr/share/ppd/${_ppdFile}" "${pkgdir}/usr/share/cups/model/${_ppdFile}"
    
    rm -vrf "${pkgdir}/usr/share/ppd"
    
    install -vDm 644 "${srcdir}/${pkgname}.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
