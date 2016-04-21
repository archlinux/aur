# Maintainer: Mykola Bespaliuk (kolkabes [at] gmail [dot] com)
pkgname=brother-hll2300d
pkgver=3.2.0_1
pkgrel=1
pkgdesc="Brother HL-L2300D CUPS driver"
url="http://www.brother.com"
arch=('x86_64' 'i686')
depends=('perl' 'bash')
license=('custom:Brother')
source=(
  http://download.brother.com/welcome/dlf101899/hll2300dcupswrapper-${pkgver//_/-}.i386.rpm
  http://download.brother.com/welcome/dlf101898/hll2300dlpr-${pkgver//_/-}.i386.rpm
)
md5sums=(
  '788bb36490f3615c47ad601a261e5f54'
  '86f88229cd00833a3ad4620207aa3829'
)

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

package() {
  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

  mkdir -p "${pkgdir}/usr/lib/cups/filter"
  echo "#! /opt/brother/Printers/HLL2300D/cupswrapper/brother_lpdwrapper_HLL2300D" > "${srcdir}/filter-shim"
  install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_HLL2300D"

  mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
  install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/HLL2300D/cupswrapper/brother-HLL2300D-cups-en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}