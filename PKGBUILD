# Maintainer: Eddie Ringle <eddie@ringle.io>
# based on https://aur.archlinux.org/packages/brother-mfc-l2713dw/
pkgname="brother-mfc-l2750dw"
pkgver="4.0.0"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-l2750DW"
url="http://solutions.brother.com/linux/en_us/"
arch=("i686" "x86_64")
license=("custom:brother commercial license")
depends=("cups")
depends_x86_64=("lib32-glibc")
install="$pkgname.install"
source=(
	"http://download.brother.com/welcome/dlf103529/mfcl2750dwpdrv-$pkgver-$pkgrel.i386.rpm"
)
md5sums=(
	"74e8e59060d8038bfb9090091354bf09"
)

package() {
	_model="MFCL2750DW"
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
