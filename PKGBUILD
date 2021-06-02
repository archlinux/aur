# Maintainer: Ben Westover <kwestover.kw@gmail.com>
# based on https://aur.archlinux.org/packages/brother-mfc-l2710dw/
pkgname='brother-hll3270cdw'
pkgver='1.0.2'
pkgrel=1
pkgdesc='LPR and CUPS driver for the Brother HL-L3270CDW'
url='http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=hll3270cdw_us_eu_as'
arch=('i686' 'x86_64')
license=('custom:Brother commercial license')
depends=('cups')
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=("https://download.brother.com/welcome/dlf103945/hll3270cdwpdrv-$pkgver-0.i386.rpm")
sha256sums=('18b479c8587430675d13e116dcf4e77010840ff47e61bc80d91c3ab87023abc1')

package() {
	_model="hll3270cdw"

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
}
