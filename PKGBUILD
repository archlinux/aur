# Maintainer: Patrick Jennings <patrick at jenningsga dot com>
# Contributor: Daniel Wyatt <Daniel.Wyatt at gmail dot com>
pkgname=brother-hll2370dw
pkgver=4.0.0
pkgrel=1
pkgdesc='Brother HL-L2370DW(XL) CUPS driver'
arch=('i686' 'x86_64' 'armv7l')
url='http://www.brother.com'
license=('GPL')
depends=('cups' 'perl')
source=(https://download.brother.com/welcome/dlf103582/hll2370dwpdrv-$pkgver-1.i386.rpm)
sha256sums=('952ec6268bbc6a5cf331fd6f3b5d7a4537d515e12d92af7d2d2699ab778e33d6')

package() {
  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2370DW/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2370DW/lpd/lpdfilter"

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/HLL2370DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL2370DW"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/HLL2370DW/cupswrapper/brother-HLL2370DW-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/HLL2370DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/HLL2370DW/lpd/"
  ln -s "/usr/share/brother/Printers/HLL2370DW/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/HLL2370DW/lpd/"

  # symlink for inf because it tries to execute it there
  ln -s "/usr/share/brother/Printers/HLL2370DW/inf" "$pkgdir/usr/share/brother/Printers/HLL2370DW/lpd/"
}
