# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: Ben Westover <kwestover.kw@gmail.com>
# based on https://aur.archlinux.org/packages/brother-hll3270cdw

pkgname=brother-hll3210cw
pkgver=1.0.2
pkgrel=2
pkgdesc="LPD and CUPS driver for the Brother HL-L3210CW."
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=hll3210cw_us_eu_as"
license=('custom:brother')
depends=('cups')
source=(
  "https://download.brother.com/welcome/dlf103942/hll3210cwpdrv-1.0.2-0.i386.rpm"
)
sha256sums=('8c8af0165852ea37341cc4f6c886191faefd64386d6567365f7e1b178d42bdc0')
! [ "$CARCH" = 'x86_64' ] || depends+=('lib32-glibc')

package() {
	_model="hll3210cw"

	# using /usr/share instead of /opt
	mkdir -p "$pkgdir/usr/share"
	cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/$_model/cupswrapper/brother_lpdwrapper_$_model"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/$_model/lpd/filter_$_model"

	# /etc/printcap is managed by cups
	find "$pkgdir" -type f -name 'setupPrintcap*' -delete

	# symlink for lpdwrapper so it correctly figures out the printer model from the path
	install -d "$pkgdir/usr/lib/cups/filter/"
	ln -s "/usr/share/brother/Printers/$_model/cupswrapper/brother_lpdwrapper_$_model" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_$_model"

	# symlink for the PPD
	install -d "$pkgdir/usr/share/cups/model/"
	ln -s "/usr/share/brother/Printers/$_model/cupswrapper/brother_${_model}_printer_en.ppd" "$pkgdir/usr/share/cups/model/"

	# a couple architecture-specific symlinks
	ln -s "/usr/share/brother/Printers/$_model/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"
	ln -s "/usr/share/brother/Printers/$_model/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"

	# symlink for inf because it tries to execute it there
	ln -s "/usr/share/brother/Printers/$_model/inf" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"

	# install license
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "$pkgdir/usr/share/brother/Printers/$_model/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 "$pkgdir/usr/share/brother/Printers/$_model/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/"
}
