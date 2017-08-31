# Maintainer: Tyler Bevan (tbevan12 at gmail dot com)
# Contributor: Mykola Bespaliuk (kolkabes [at] gmail [dot] com)
pkgname=brother-hll2315dw
pkgver=3.2.1_1
pkgrel=1
pkgdesc="Brother HL-L2315DW CUPS driver"
url="http://www.brother.com"
arch=('x86_64' 'i686')
depends=('perl' 'bash' 'cups')
license=('custom:Brother')
source=(
  http://download.brother.com/welcome/dlf103313/hll2315dwcupswrapper-${pkgver//_/-}.i386.rpm
  http://download.brother.com/welcome/dlf103293/hll2315dwlpr-${pkgver//_/-}.i386.rpm
)
md5sums=(
  'b2de10af3f8940fb708089d6164ee6b3'
  'abae60fea4451c67ab99d7718ef8bcac'
)

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

package() {
  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

  mkdir -p "${pkgdir}/usr/lib/cups/filter"
  echo "#! /opt/brother/Printers/HLL2315DW/cupswrapper/brother_lpdwrapper_HLL2315DW" > "${srcdir}/filter-shim"
  install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_HLL2315DW"

  mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
  install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/HLL2315DW/cupswrapper/brother-HLL2315DW-cups-en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}

