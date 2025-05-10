# Maintainer: Antonio Curavalea <one dot kyonblack at gmail dot com>
# Maintainer: Vin <vin at vinnae dot gay>

_appname='ygo-omega'
pkgname=ygo-omega
pkgver=latest
pkgrel=3
pkgdesc="The Ultimate Yu-Gi-Oh! Simulator."
arch=('x86_64')
url='https://github.com/duelists-unite'
license=('AGPL3')
provides=("${_appname}")
conflicts=("${_appname}")
install="${_appname}.install"
source=(
	"linux-x64.zip::https://github.com/duelists-unite/omega-releases/releases/$pkgver/download/linux-x64.zip"
	"${_appname}.desktop.in"
	"${_appname}.in"
)
sha256sums=('SKIP'
            'd159c3910d3b68675a4a098c3384e376e1a02e593e94289a686cb183690cdc87'
            'afdcd9a09a9664c963a6a9a92e95345bd4bc8e967fe5a453c27fab488bf1c0ca')
options=('emptydirs')

# Make a string suitable for `sed`, by escaping `[]/&$.*^\` - syntax: `_sed_escape STRING`
_sed_escape() {
	echo "${1}" | sed 's/[]\/&.*$^[]/\\&/g'
}

package() {
	local _sed_subst="
		s/@PACKAGE_NAME@/$(_sed_escape "${_appname}")/g
		s/@PACKAGE_VERSION@/$(_sed_escape "${pkgver}")/g
		s/@PACKAGE_RELEASE@/$(_sed_escape "${pkgrel}")/g
		s/@PACKAGE_ARCH@/$(_sed_escape "${_archstr}")/g
	"

	install -dm755 "${pkgdir}/usr/share/applications"
	sed "${_sed_subst}" "${_appname}.desktop.in" > \
		"${pkgdir}/usr/share/applications/${_appname}.desktop"
	install -Dm444 "linux-x64.zip" \
		"${pkgdir}/opt/ygo-omega/linux-x64.zip"

	install -dm755 "${pkgdir}/usr/bin"
	sed "${_sed_subst}" "${_appname}.in" > "${pkgdir}/usr/bin/${_appname}"
	chmod +x "${pkgdir}/usr/bin/${_appname}"

	install -d -m 755 "$pkgdir/opt/ygo-omega/"
	cp -a --no-preserve='ownership' * "$pkgdir/opt/ygo-omega/"
}

