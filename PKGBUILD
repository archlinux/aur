# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=nextai-translator-bin
_pkgname=NextAI.Translator
pkgver=0.6.5
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
sha256sums=('78664f9cf8f9110ce089d2f15c820eafb3ec8e01339377ef8044387240adc525')
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
	_icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
}
