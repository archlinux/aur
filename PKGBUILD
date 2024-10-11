# Maintainer: Steven Hicks <site-brhll32810aur@stevenkhicks.de>
# based on https://aur.archlinux.org/packages/brother-mfc-l2710dw/
pkgname='brother-hll3280cdw'
pkgver='3.5.1'
pkgrel=1
pkgdesc='LPR and CUPS driver for the Brother HL-L3280CDW'
url='https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=hll3280cdw_us_as&os=127&dlid=dlf105746_000&flang=4&type3=10282'
arch=('i686' 'x86_64')
license=('custom:Brother commercial license')
depends=('cups')
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=("https://download.brother.com/welcome/dlf105746/hll3280cdwpdrv-$pkgver-1.i386.rpm")
sha256sums=('798a6cbda2a21d7046c5e0a7a68a4aff16e0fbd75982d93ac2a74462efbbc8af')

package() {
	_model="hll3280cdw"

	# using /usr/share instead of /opt
	mkdir -p "$pkgdir/usr/share"
	cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/$_model/cupswrapper/brother_lpdwrapper_$_model"
	sed -i 's|/opt/|/usr/|' "$pkgdir/usr/share/brother/Printers/$_model/lpd/filter_$_model"
	sed -i 's|/opt/|/usr/|' "$pkgdir/usr/share/brother/Printers/$_model/cupswrapper/cupswrapper$_model"

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
        ln -s "/usr/share/brother/Printers/$_model/lpd/$CARCH/br${_model}filter" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"

	# symlink for inf because it tries to execute it there
	ln -s "/usr/share/brother/Printers/$_model/inf" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"
}
