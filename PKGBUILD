# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=nextai-translator-bin
_pkgname=NextAI.Translator
pkgver=0.6.19
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
source=(
	"${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('5a03438980474776f06e751419f4f6ab1da75b49d6cd0afa7a885e2f5164e538')
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
	find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
}
