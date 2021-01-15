pkgname=brother-dcp-l2550dw
pkgver=4.0.0
pkgrel=2
pkgdesc="LPR and CUPS driver for the Brother DCP-L2550DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadhowto.aspx?c=ca&lang=en&prod=dcpl2550dw_us&os=127&dlid=dlf103576_000&flang=4&type3=10282"
license=("EULA")
source=("https://download.brother.com/welcome/dlf103576/dcpl2550dwpdrv-4.0.0-1.i386.rpm")
md5sums=('92279e64ec1e40714bb707ab9aab2600')

package() {
  # This package is based off of the brother-mfc-l2710dw package due to the identical packaging. All credit should go to enginefeeder101 for the script.

	_model="DCPL2550DW"

  # using /usr/share instead of /opt
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/$_model/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/$_model/lpd/lpdfilter"

  # /etc/printcap is managed by cups
  find "$pkgdir" -type f -name 'setupPrintcap*' -delete

  # symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "$pkgdir/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/$_model/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_$_model"

  # symlink for the PPD
  install -d "$pkgdir/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/$_model/cupswrapper/brother-$_model-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

  # a couple architecture-specific symlinks
  ln -s "/usr/share/brother/Printers/$_model/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"
  ln -s "/usr/share/brother/Printers/$_model/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"

  # symlink for inf because it tries to execute it there
  ln -s "/usr/share/brother/Printers/$_model/inf" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"
}
