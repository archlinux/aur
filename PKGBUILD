# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=nextai-translator-bin
_pkgname=NextAI.Translator
pkgver=0.6.55
pkgrel=1
pkgdesc="Browser extension and cross-platform desktop application for translation based on ChatGPT API.(Prebuilt version)基于 ChatGPT API 的划词翻译浏览器插件和跨平台桌面端应用"
arch=('x86_64')
url="https://github.com/nextai-translator/nextai-translator"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
	"${pkgname%-bin}"
	"openai-translator"
)
depends=(
	'gtk3'
	'webkit2gtk-4.1'
	'xdotool'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('89fd3a90d48c06a98429c301587f8b6d5292ceaf21dc65369c61cdc48c4d06ed')
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
		s/Exec=app/Exec=${pkgname%-bin}/g
		s/Icon=app/Icon=${pkgname%-bin}/g
	" "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/app" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/usr/lib/${_pkgname//./ }/resources/"*.* -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
	install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
	_install_icons

}
