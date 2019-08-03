# Maintainer: Félix Saparelli <felix@passcod.name>
# Based on brother-dcpl3551cdw package from AUR.

pkgname="brother-dcpl3551cdw"
pkgver="1.0.2"
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-L3551CDW"
arch=('x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpl3551cdw_eu"
license=('unknown')
_model="dcpl3551cdw"
_revision=0

source=("http://download.brother.com/welcome/dlf103939/${_model,,}pdrv-${pkgver}-${_revision}.i386.rpm")
md5sums=('d020c3259363cfef9ed8efbe90b779ec')

package() {
	# Using /usr/share instead of /opt
	mkdir -p "$pkgdir/usr/share"
	cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_${_model}"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/${_model}/lpd/filter_${_model}"

	# symlink for lpdwrapper so it correctly figures out the printer model from the path
	install -d "$pkgdir/usr/lib/cups/filter/"
	ln -s "/usr/share/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_${_model}" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_model}"

	# symlink for the PPD
	install -d "$pkgdir/usr/share/cups/model/"
	ln -s "/usr/share/brother/Printers/${_model}/cupswrapper/brother_${_model}_printer_en.ppd" "$pkgdir/usr/share/cups/model/"

	# a couple architecture-specific symlinks
	#ln -s "/usr/share/brother/Printers/${_model}/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"
	#ln -s "/usr/share/brother/Printers/${_model}/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"

	# symlink for inf because it tries to execute it there
	ln -s "/usr/share/brother/Printers/${_model}/inf" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"
}

