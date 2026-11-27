# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=oxideterm-bin
_pkgname=OxideTerm
pkgver=2.4.2
pkgrel=1
pkgdesc="AI-native workspace for local shells and remote machines.Zero Webview, zero OpenSSL, zero telemetry, and no app subscription."
arch=(
	'aarch64'
	'x86_64'
)
url="https://oxideterm.app/"
_ghurl="https://github.com/AnalyseDeCircuit/oxideterm"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'gstreamer'
	'alsa-lib'
	'libxkbcommon'
	'gst-plugins-base-libs'
	'dbus'
	'libxcb'
	'libxkbcommon-x11'
	'libappindicator'
	'libayatana-appindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x64.deb")
sha256sums_aarch64=('2ea572fc43d5816274b85e89383e138b274e3e58e91d5b47f0c0c0365c9f3b1f')
sha256sums_x86_64=('3242a29dc74d7f4b9afffa31e6b45ec89d866f3ae496f19db26d4835d2756e09')
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
	sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/com.${pkgname%-bin}.app.desktop"
	local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x86_64 || echo aarch64)
	find "${srcdir}/opt/${pkgname%-bin}" -type f \
		\( -name '*darwin*' -o -name '*android*' -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
}
package() {
	install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
	cp -a "${srcdir}/opt/${pkgname%-bin}/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
	ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}-native" "${pkgdir}/usr/bin/${pkgname%-bin}-native"
	_install_icons
	install -Dm644 "${srcdir}/usr/share/applications/com.${pkgname%-bin}.app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}