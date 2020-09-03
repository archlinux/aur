pkgname=brother-dcp-b7520dw
pkgver=4.0.0
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP-B7520DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadhowto.aspx?c=eu_ot&lang=en&prod=dcpb7520dw_eu&os=127&dlid=dlf103651_000&flang=4&type3=10282"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103651/dcpb7520dwpdrv-4.0.0-1.i386.rpm")
md5sums=('63a8bae56d8c92f10e8573e82030b628')

package() {
  # This package is based off of the brother-mfc-l2710dw package due to the identical packaging. All credit should go to enginefeeder101 for the script.

	_model="DCPB7520DW"

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

