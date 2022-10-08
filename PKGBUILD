# Maintainer: Stefano Franchi <stefano.franchi at gmail dot com>
# Based on brother-hll-2350dw by Roman Schmocker (schmocker.roman at gmail)
pkgname=brother-hll2325dw
pkgver=4.0.0
pkgrel=1
pkgdesc='Brother HL-L2325DW CUPS driver'
arch=('i686' 'x86_64')
url='http://www.brother.com'
license=('GPL')
depends=('cups' 'perl' 'ghostscript')
source=(https://download.brother.com/welcome/dlf105332/hll2325dwpdrv-$pkgver-$pkgrel.i386.rpm)
sha256sums=('5be7e0ea373b74e8d0ed6fe945f1d6e41bd4316984ec35c455a4baaaed83381f')

package() {
  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2325DW/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2325DW/lpd/lpdfilter"

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/HLL2325DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL2325DW"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/HLL2325DW/cupswrapper/brother-HLL2325DW-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/HLL2325DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/HLL2325DW/lpd/"
  ln -s "/usr/share/brother/Printers/HLL2325DW/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/HLL2325DW/lpd/"

  # symlink for inf because it tries to execute it there
  ln -s "/usr/share/brother/Printers/HLL2325DW/inf" "$pkgdir/usr/share/brother/Printers/HLL2325DW/lpd/"
}

