# Maintainer: Brian Durksen <brian at durksen dot pw>
pkgname=brother-hll2320d
pkgver=3.2.0_1
pkgrel=1
pkgdesc="Brother HL-L2320D CUPS driver"
url="http://www.brother.com"
arch=('x86_64' 'i686')
depends=('perl' 'bash')
license=('custom:Brother')
source=(
  "http://download.brother.com/welcome/dlf101906/hll2320dlpr-${pkgver//_/-}.i386.rpm"
  "http://download.brother.com/welcome/dlf101907/hll2320dcupswrapper-${pkgver//_/-}.i386.rpm"
)
md5sums=(
  'ca753f68807bd1002c2000225512a75b'
  '98d6f5fdbb50d6a3a2557a2630c7bc0e'
)

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

package() {
  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

  mkdir -p "${pkgdir}/usr/lib/cups/filter"
  echo "#! /opt/brother/Printers/HLL2320D/cupswrapper/brother_lpdwrapper_HLL2320D" > "${srcdir}/filter-shim"
  install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_HLL2320D"

  mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
  install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/HLL2320D/cupswrapper/brother-HLL2320D-cups-en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}