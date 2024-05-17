# Maintainer: Rene Peinthor <peinthor@gmail.com>
# Based on brother-hll2370dn package from AUR.

pkgname="brother-dcpl3550cdw"
pkgver="1.0.2"
pkgrel=3
pkgdesc="CUPS driver for Brother DCP-L3550CDW"
arch=('x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpl3550cdw_eu"
license=('unknown')
depends=('lib32-glibc')
_model="dcpl3550cdw"
_revision=0

#https://download.brother.com/welcome/dlf103938/dcpl3550cdwpdrv-1.0.2-0.i386.rpm
source=("http://download.brother.com/welcome/dlf103938/${_model,,}pdrv-${pkgver}-${_revision}.i386.rpm")
md5sums=("155eed84f5cbd7f406582d83c1c5c2d3")

package() {
	# Using /usr/share instead of /opt
	mkdir -p "$pkgdir/opt/brother"
	cp -R "$srcdir/opt/brother" "$pkgdir/opt"

	# symlink for lpdwrapper so it correctly figures out the printer model from the path
	install -d "$pkgdir/usr/lib/cups/filter/"
	ln -s "/opt/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_${_model}" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_model}"

	# symlink for the PPD
	install -d "$pkgdir/usr/share/cups/model/Brother"
	ln -s "/opt/brother/Printers/${_model}/cupswrapper/brother_${_model}_printer_en.ppd" "$pkgdir/usr/share/cups/model/Brother"

	# a couple architecture-specific symlinks
	#ln -s "/usr/share/brother/Printers/${_model}/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"
	#ln -s "/usr/share/brother/Printers/${_model}/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"

	# symlink for inf because it tries to execute it there
	ln -s "/opt/brother/Printers/${_model}/inf" "$pkgdir/opt/brother/Printers/${_model}/lpd/"

	mkdir -p "${pkgdir}/usr/bin"
	install "${srcdir}/usr/bin/brprintconf_${_model}" "${pkgdir}/usr/bin/"
}

