# Maintainer: Alex Parrill <alex.parrill@col32.net>
# based on https://aur.archlinux.org/packages/brother-mfc-l2750dw/
pkgname="brother-hl-l2420dw"
pkgver="4.1.0"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother HL-L2420DW"
url="http://solutions.brother.com/linux/en_us/"
arch=("i686" "x86_64")
license=("custom:brother commercial license")
depends=("cups")
depends_x86_64=("lib32-glibc")
install="$pkgname.install"
source=(
  "https://download.brother.com/welcome/dlf105956/hll2420dwpdrv-$pkgver-$pkgrel.i386.rpm"
)
sha512sums=(
	"ef4405db411afc861cbb3e2f677677a74ae263b7222bc49c53e2a7a4373b65a9a0c4844cfd4eb680fa5a32a4a93cce5842c79612587292e2713f4b813ef90b11"
)

package() {
	_model="HLL2420DW"
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
}
