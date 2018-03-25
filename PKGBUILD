# Maintainer: Angus Gratton <gus at projectgus dot com> )
# (Based on brother-hll2395dw package by Daniel Wyatt)
pkgname=brother-mfc-l2713dw
pkgver=4.0.0
pkgrel=1
pkgdesc='Brother MFC-L2713DW CUPS driver'
arch=('i686' 'x86_64')
url='http://www.brother.com'
license=('GPL')
depends=('cups' 'perl')
source=(http://download.brother.com/welcome/dlf103523/mfcl2713dwpdrv-$pkgver-1.i386.rpm)
sha256sums=('55dafceb443cd4b0b7558652e4c30cdc420f1706756c4e0ae09de88644224aa3')

package() {
  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/MFCL2713DW/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/MFCL2713DW/lpd/lpdfilter"

  # /etc/printcap is managed by cups
  find "$pkgdir" -type f -name 'setupPrintcap*' -delete

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/MFCL2713DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_MFCL2713DW"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/MFCL2713DW/cupswrapper/brother-MFCL2713DW-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/MFCL2713DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/MFCL2713DW/lpd/"
  ln -s "/usr/share/brother/Printers/MFCL2713DW/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/MFCL2713DW/lpd/"

  # symlink for inf because it tries to execute it there
  ln -s "/usr/share/brother/Printers/MFCL2713DW/inf" "$pkgdir/usr/share/brother/Printers/MFCL2713DW/lpd/"
}

