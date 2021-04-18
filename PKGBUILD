# Maintainer: Tasnad Kernetzky <tasnadk at gmail dot com>

pkgname=brother-dcpl2520dw
pkgver=3.2.0_1
pkgrel=4
pkgdesc="Brother DCP-L2520DW lpr driver and CUPS wrapper."
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=dcpl2520dw_us_eu&os=127&dlid=dlf101757_000&flang=4&type3=558"
license=('GPL2' 'custom:brother')
depends=('cups')
optdepends=('brscan4: scanner support.')
source=(
  "http://download.brother.com/welcome/dlf101757/dcpl2520dwlpr-${pkgver/_/-}.i386.rpm"
  "http://download.brother.com/welcome/dlf101758/dcpl2520dwcupswrapper-${pkgver/_/-}.i386.rpm"
  '99-brprint-dcpl2520dw.rules'
)
md5sums=(
  'de61fcda5985944d6dd1e5735cf7897b'
  '4beb9def6c55f7c97d6e654c77eaf4a8'
  'd6535a47019acd179f8317beecf4fcd4'
)

if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

prepare() {
  sed -i -e '47,53c my $basedir = "/opt/brother/Printers/DCPL2520DW";' \
    ${srcdir}/opt/brother/Printers/DCPL2520DW/cupswrapper/brother_lpdwrapper_DCPL2520DW
}

package() {
  mkdir -p ${pkgdir}/usr/share/cups/model/Brother
  mkdir -p ${pkgdir}/usr/lib/cups/filter
  cp ${srcdir}/opt/brother/Printers/DCPL2520DW/cupswrapper/brother-DCPL2520DW-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother
  cp ${srcdir}/opt/brother/Printers/DCPL2520DW/cupswrapper/brother_lpdwrapper_DCPL2520DW ${pkgdir}/usr/lib/cups/filter

  mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2520DW
  cp -r ${srcdir}/opt/brother/Printers/DCPL2520DW/inf ${pkgdir}/opt/brother/Printers/DCPL2520DW/
  cp -r ${srcdir}/opt/brother/Printers/DCPL2520DW/lpd ${pkgdir}/opt/brother/Printers/DCPL2520DW/
  cp -r ${srcdir}/var ${pkgdir}/
  cp -r ${srcdir}/etc ${pkgdir}/

  install -m 644 -D 99-brprint-dcpl2520dw.rules $pkgdir/usr/lib/udev/rules.d/99-brprint-dcpl2520dw.rules
}
