# Maintainer: Daniel Wyatt <Daniel.Wyatt at gmail dot com>
pkgname=brother-hll2395dw
pkgver=4.0.0
pkgrel=2
pkgdesc='Brother HL-L2395DW CUPS driver'
arch=('i686' 'x86_64')
url='http://www.brother.com'
license=('GPL')
depends=('cups' 'perl' 'ghostscript')
source=(http://download.brother.com/welcome/dlf103563/hll2395dwpdrv-$pkgver-1.i386.rpm)
sha256sums=('522b57c1b024f6860a0d0b22fe7050788b7a30b6be920479dff85865ff937380')

package() {
  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2395DW/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2395DW/lpd/lpdfilter"

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/HLL2395DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL2395DW"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/HLL2395DW/cupswrapper/brother-HLL2395DW-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/HLL2395DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/HLL2395DW/lpd/"
  ln -s "/usr/share/brother/Printers/HLL2395DW/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/HLL2395DW/lpd/"

  # symlink for inf because it tries to execute it there
  ln -s "/usr/share/brother/Printers/HLL2395DW/inf" "$pkgdir/usr/share/brother/Printers/HLL2395DW/lpd/"
}

