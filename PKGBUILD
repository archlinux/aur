# Maintainer: Mandeep Sangwan <mandeep@spydrr.com>
pkgname=brother-dcp-b7535dw
pkgver=4.0.0
pkgrel=1
pkgdesc="LPR and CUPS driver for Brother DCP-B7535DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=in&lang=en&prod=dcpb7535dw_as_cn"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103654/dcpb7535dwpdrv-4.0.0-1.i386.rpm")
md5sums=("f434d25defabe54b4ccebe0510ff4c87")

package() {
  # This package is based off of the brother-mfc-l2710dw package due to the identical packaging. All credit should go to enginefeeder101 for the script.

	_model="DCPB7535DW"

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

