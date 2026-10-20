# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apiflow-bin
_pkgname=ApiFlow
pkgver=0.9.83
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums=('1c8f6daf492f059c2837ab0c8b505b81e9d9220013c094a2e9fac893399d08f5')
sha256sums_aarch64=('293449c4d414c3bb985eec40d5c70ce3dc3fd48529a1736cbd744250447e27fc')
sha256sums_x86_64=('8c69958f84d36febafc8f2980ff201326684b851b8bc280b9c337f78d0432c05')
prepare() {
	sed -i -e "
		s/Exec=${pkgname%-bin}-desktop/Exec=${pkgname%-bin}/g
		s/Icon=${pkgname%-bin}-desktop/Icon=${pkgname%-bin}/g
	" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}-desktop" "${pkgdir}/usr/bin/${pkgname%-bin}"
	[ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
	find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
	install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
