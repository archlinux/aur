pkgname=brother-hll2445dw-lpr-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="LPR driver for Brother HL-L2445DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=hll2445dw_eu_as"
license=("GPL2")
depends=("cups" "perl")
source=("https://download.brother.com/welcome/dlf105961/hll2445dwpdrv-4.1.0-1.i386.deb")
b2sums=('39d863d6b2714ac30c459e9063db70be33c9ac91437594b656d4202e34020f4f0d9d0d92c40df360285494c41971f9f43d14fabbaf7b32c51e9bc1f251d17bb7')

prepare() {
  tar -xf data.tar.gz -C "$srcdir"
}

package() {
  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2445DW/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/HLL2445DW/lpd/lpdfilter"

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/HLL2445DW/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL2445DW"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/HLL2445DW/cupswrapper/brother-HLL2445DW-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/HLL2445DW/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/HLL2445DW/lpd/"
  ln -s "/usr/share/brother/Printers/HLL2445DW/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/HLL2445DW/lpd/"

  # symlink for inf because it tries to execute it there
  rmdir "$pkgdir/usr/share/brother/Printers/HLL2445DW/lpd/inf"
  ln -s "/usr/share/brother/Printers/HLL2445DW/inf" "$pkgdir/usr/share/brother/Printers/HLL2445DW/lpd/inf"
}
