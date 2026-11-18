# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apiflow-bin
_pkgname=ApiFlow
pkgver=0.9.84
pkgrel=1
pkgdesc="A modern API workspace that works both online and offline — combining API documentation, testing, mock, and AI-powered automation in one lightweight tool."
arch=(
    'aarch64'
    'x86_64'
)
url="https://apiflow.cn/"
_ghurl="https://github.com/trueleaf/apiflow"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'gtk3'
	'gdk-pixbuf2'
	'webkit2gtk-4.1'
	'libayatana-indicator'
	'libappindicator'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/trueleaf/apiflow/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('1c8f6daf492f059c2837ab0c8b505b81e9d9220013c094a2e9fac893399d08f5')
sha256sums_aarch64=('a5e4a9693bc5650d972ea1a09e2f0fd9cbf7924f48d5ed7c721c37643169ed3a')
sha256sums_x86_64=('89d9fa2b606dbc0fbacab01c1052693e278fbd4fe2c6b4c41010db42c72bdc88')
_install_icons() {
	local _src="${1:-${srcdir}}" _name="${pkgname%-bin}" _icon _ext _size _dest
	while IFS= read -r -d '' _icon; do
		_ext="${_icon##*.}"
		_size=$(echo "${_icon%/*}" | grep -oE '[0-9]+x[0-9]+|scalable' | head -1)
		[[ -z "${_size}" ]] && _size=$([[ "${_ext}" == svg ]] && echo scalable || od -An -tu1 -j16 -N8 "${_icon}" 2>/dev/null | awk '{printf "%dx%d",$1*16777216+$2*65536+$3*256+$4,$5*16777216+$6*65536+$7*256+$8}')
		[[ "${_size}" =~ ^[0-9]+x[0-9]+$ ]] || _size=scalable
		_dest=$([[ "${_icon}" == */share/pixmaps/* ]] && echo pixmaps || echo "icons/hicolor/${_size}/apps")
		install -Dm644 "${_icon}" "${pkgdir}/usr/share/${_dest}/${_name}.${_ext}"
	done < <(find "${_src}" \( -path '*/share/icons/*' -o -path '*/share/pixmaps/*' -o -path '*entries/icons/*' \) -type f \( -name '*.png' -o -name '*.svg' \) -print0 2>/dev/null)
}
prepare() {
	bsdtar -xf "${srcdir}/data."*
	sed -i -e "
		s/Exec=${pkgname%-bin}-desktop/Exec=${pkgname%-bin}/g
		s/Icon=${pkgname%-bin}-desktop/Icon=${pkgname%-bin}/g
	" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}-desktop" "${pkgdir}/usr/bin/${pkgname%-bin}"
	[ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
	_install_icons
	install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
