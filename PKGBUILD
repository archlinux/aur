# Maintainer: Ethan Pailes <ethan at pailes dot org>
#
# Based on PKGBUILD for https://aur.archlinux.org/packages/canon-pixma-mg2200-complete
# That example shows how to add support for a scanner driver as well if desired.

pkgname=canon-tr8600-series
pkgver=6.10
pkgrel=1
pkgdesc="Printer drivers for the Cannon 8620 series"
# url='https://www.usa.canon.com/internet/portal/us/home/support/details/printers/inkjet-multifunction/tr-series-inkjet/pixma-tr8620?tab=drivers_downloads'
url='https://gdlp01.c-wss.com/gds/1/0100010921/01/cnijfilter2-source-6.10-1.tar.gz'
arch=('x86_64')
license=('custom')
# N.B. this is an AUR package, so you'll need to manually install it
makedepends=('deb2targz') # 'sed')

if [ ${CARCH} = 'x86_64' ]; then
  depends=('popt' 'libpng12' 'libusb-compat' 'libtiff' 'libxml2' 'gtk2' 'libxml2-legacy')
fi

source=(
    'https://gdlp01.c-wss.com/gds/9/0100010919/01/cnijfilter2-6.10-1-deb.tar.gz'
)
md5sums=(
    '75ee391fc452b53b6016be9d03d95715'
)

_ppdFiles="canontr8600.ppd canontr8630.ppd "
_printDrvSrc='cnijfilter2-6.10-1-deb'
_printDrvDebCommon='cnijfilter2_6.10-1_amd64'

build() {
    cd ${srcdir}

    tar xvzf ${_printDrvSrc}.tar.gz

    rm -v *.tar.gz
}

package() {
   cd ${pkgdir}

   cp "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebCommon}.deb" .

   # convert from .deb to tarball
   deb2targz "${_printDrvDebCommon}.deb"
   rm -v *.deb

   # unpack tarball
   tar xzvf "${_printDrvDebCommon}.tar.gz"
   rm -v *.tar.gz

   # install ppd file
   for file in ${_ppdFiles}
   do
       install -vDm 644 "${pkgdir}/usr/share/ppd/${file}" "${pkgdir}/usr/share/cups/model/${file}"
   done
   rm -vrf ${pkgdir}/usr/share/ppd

   # install licence
   install -vDm 644 "${srcdir}/${_printDrvSrc}/documents/LICENSE-cnijfilter-6.10EN.txt" \
       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

   rm -vrf ${pkgdir}/usr/share/ppd
}
