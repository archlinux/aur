# Maintainer: Sam Simons <contact at sam-simons dot nl> )
# (Based on brother-hll2395dw package by Daniel Wyatt)
pkgname=brother-mfc-l2730dw
pkgver=4.0.0
pkgrel=1
pkgdesc='Brother MFC-L2730DW printer driver'
arch=('i686' 'x86_64')
url='https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=mfcl2730dw_us_eu_as'
license=('GPL')
depends=('cups' 'perl' 'ghostscript')
source=(https://download.brother.com/welcome/dlf103527/mfcl2730dwpdrv-4.0.0-1.i386.rpm)
sha256sums=('5c82b2c224a6651678ba77261ad4952dc876f633b4c05f86d115ca71358861af')

package() {
  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/MFCL2730DW/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/MFCL2730DW/lpd/lpdfilter"

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/MFCL2730DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_MFCL2730DW"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/MFCL2730DW/cupswrapper/brother-MFCL2730DW-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/MFCL2730DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/MFCL2730DW/lpd/"
  ln -s "/usr/share/brother/Printers/MFCL2730DW/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/MFCL2730DW/lpd/"

  # symlink for inf because it tries to execute it there
  ln -s "/usr/share/brother/Printers/MFCL2730DW/inf" "$pkgdir/usr/share/brother/Printers/MFCL2730DW/lpd/"
}
