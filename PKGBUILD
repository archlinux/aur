# Maintainer: Lucas Marcondes <lucasnascimento95@gmail.com>

pkgname=brother-hll1222
pkgver=4.4.0
_pkgrel_brother=2
pkgrel=1
pkgdesc='Brother HL-L1222 CUPS driver'
arch=('x86_64')
url='https://support.brother.com/'
license=('LicenseRef-Brother' 'GPL-2.0-or-later')
depends=('cups' 'ghostscript' 'perl')
options=('!strip' '!debug')
source=("https://download.brother.com/welcome/dlf106419/hll1222pdrv-${pkgver}-${_pkgrel_brother}.x86_64.rpm")
sha256sums=('beed9c0d31eaf09297d6bfe5fa2eaaf291ca3deae5cf39883d7d4f7f03764ee8')
install="${pkgname}.install"

package() {
	local _model=HLL1222
	local _basedir="opt/brother/Printers/${_model}"

	# Brother layout (filter resolves paths via realpath of itself under /opt)
	cp -a "${srcdir}/opt" "${pkgdir}/"

	# Vendor postinst would link arch binaries into lpd/
	ln -s "x86_64/rawtobr3" "${pkgdir}/${_basedir}/lpd/rawtobr3"
	ln -s "x86_64/brprintconflsr3" "${pkgdir}/${_basedir}/lpd/brprintconflsr3"

	# CUPS expects filter name from the PPD
	install -dm755 "${pkgdir}/usr/lib/cups/filter"
	ln -s "/${_basedir}/cupswrapper/lpdwrapper" \
		"${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_${_model}"

	install -dm755 "${pkgdir}/usr/share/cups/model/Brother"
	ln -s "/${_basedir}/cupswrapper/brother-${_model}-cups-en.ppd" \
		"${pkgdir}/usr/share/cups/model/Brother/"

	install -Dm644 "${_basedir}/LICENSE_ENG.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ENG.txt"
	install -Dm644 "${_basedir}/cupswrapper/Copying" \
		"${pkgdir}/usr/share/licenses/${pkgname}/Copying"
}
