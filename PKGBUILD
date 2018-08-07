# Maintainer: Marc-Andre Lamothe <malbeth at zoho dot com>
pkgname=brother-hll2390dw
pkgver=4.0.0
pkgrel=1
pkgdesc='Brother HL-L2390DW CUPS driver'
arch=('i686' 'x86_64')
url='http://www.brother.com'
license=('GPL')
depends=('cups' 'ghostscript' 'perl')
source=(http://download.brother.com/welcome/dlf103578/hll2390dwpdrv-$pkgver-$pkgrel.i386.rpm)
sha256sums=('15215422859886c67f4e23f18d1bafdfe47edf619bcc3c74f84f5bcc6b9d8ea2')

package() {
  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\/opt\/|\/usr\/share\/|' "$pkgdir/usr/share/brother/Printers/HLL2390DW/inf/setupPrintcap"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2390DW/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2390DW/lpd/lpdfilter"

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/HLL2390DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL2390DW"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/HLL2390DW/cupswrapper/brother-HLL2390DW-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/HLL2390DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/HLL2390DW/lpd/"
  ln -s "/usr/share/brother/Printers/HLL2390DW/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/HLL2390DW/lpd/"

  # symlink for inf because it tries to execute it there
  ln -s "/usr/share/brother/Printers/HLL2390DW/inf" "$pkgdir/usr/share/brother/Printers/HLL2390DW/lpd/"
}

