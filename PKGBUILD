# Maintainer: Marius Kaufmann <dasug@improved-madness.de>
# Based on brother-dcpl3550cdw package from AUR, which in turn is based on brother-hll2370dn.

pkgname="brother-dcpl3515cdw"
pkgver="3.5.1"
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-L3515CDW"
arch=('x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpl3515cdw_eu"
license=('custom:brother-license' 'GPL-2.0-only')
depends=('cups' 'perl' 'ghostscript')
_model="dcpl3515cdw"
_revision=2

#https://download.brother.com/welcome/dlf105768/dcpl3515cdwpdrv-3.5.1-2.i386.rpm
source=("https://download.brother.com/welcome/dlf105768/${_model,,}pdrv-${pkgver}-${_revision}.i386.rpm")
sha256sums=("77f73f76873a75f53f9a709ec064430d9b820ca478d7e625b800e4046df1630c")

package() {
	mkdir -p "$pkgdir/opt/brother"
	cp -R "$srcdir/opt/brother" "$pkgdir/opt"

	# symlink for lpdwrapper so it correctly figures out the printer model from the path
	install -d "$pkgdir/usr/lib/cups/filter/"
	ln -s "/opt/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_${_model}" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_model}"

	# symlink for the PPD
	install -d "$pkgdir/usr/share/cups/model/Brother"
	ln -s "/opt/brother/Printers/${_model}/cupswrapper/brother_${_model}_printer_en.ppd" "$pkgdir/usr/share/cups/model/Brother"

	# symlink for inf because it tries to execute it there
	ln -s "/opt/brother/Printers/${_model}/inf" "$pkgdir/opt/brother/Printers/${_model}/lpd/"

	# the filter script is invoked with the full path so it needs to exist in lpd
	ln -s "${CARCH}/br${_model}filter" "${pkgdir}/opt/brother/Printers/${_model}/lpd/br${_model}filter"

	# brprintconf is invoked as a bare command by the cups wrapper, so it needs to be visible in the path
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/brother/Printers/${_model}/lpd/${CARCH}/brprintconf_${_model}" "$pkgdir/usr/bin/brprintconf_${_model}"

	# install custom brother license files
	install -Dm644 "${srcdir}/opt/brother/Printers/${_model}/LICENSE_ENG.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/opt/brother/Printers/${_model}/LICENSE_JPN.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

