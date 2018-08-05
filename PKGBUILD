# Maintainer: Cameron Eagans <me@cweagans.net>
# Based on brother-hll2370dn package from AUR.

pkgname="brother-dcpl2550dw"
pkgver="4.0.0"
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-L2550DW"
arch=('x86_64')
url="http://support.brother.com/g/b/producttop.aspx?c=us_ot&lang=en&prod=dcpl2550dw_us"
license=('unknown')
_model="DCPL2550DW"
_revision=1

source=("http://download.brother.com/welcome/dlf103576/${_model,,}pdrv-${pkgver}-${_revision}.i386.rpm")
md5sums=("92279e64ec1e40714bb707ab9aab2600")

package() {
	# Using /usr/share instead of /opt
	mkdir -p "$pkgdir/usr/share"
	cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/${_model}/cupswrapper/lpdwrapper"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/${_model}/lpd/lpdfilter"

	# symlink for lpdwrapper so it correctly figures out the printer model from the path
	install -d "$pkgdir/usr/lib/cups/filter/"
	ln -s "/usr/share/brother/Printers/${_model}/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_model}"

	# symlink for the PPD
	install -d "$pkgdir/usr/share/cups/model/"
	ln -s "/usr/share/brother/Printers/${_model}/cupswrapper/brother-${_model}-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

	# a couple architecture-specific symlinks
	ln -s "/usr/share/brother/Printers/${_model}/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"
	ln -s "/usr/share/brother/Printers/${_model}/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"

	# symlink for inf because it tries to execute it there
	ln -s "/usr/share/brother/Printers/${_model}/inf" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"
}

