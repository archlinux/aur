# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=open-ai-translator-bin
_pkgname=OpenAI.Translator
pkgver=0.4.32
pkgrel=1
pkgdesc="基于 ChatGPT API 的划词翻译浏览器插件和跨平台桌面端应用 - Browser extension and cross-platform desktop application for translation based on ChatGPT API."
arch=('x86_64')
url="https://github.com/openai-translator/openai-translator"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
	"${pkgname%-bin}"
	"openai-translator"
)
depends=(
	'gtk3'
	'java-runtime'
	'webkit2gtk-4.1'
	'xdotool'
)
source=(
	"${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('463cac53bd8c15e45b22b261f2cf1e8152d67121b11a54cd38177ee300745de5')
build() {
	bsdtar -xf "${srcdir}/data."*
	sed "s|app|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/app.desktop"
	sed "4i\Comment=${pkgdesc}" -i "${srcdir}/usr/share/applications/app.desktop"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/app" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/usr/lib/app/resources/"*.* -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
	install -Dm755 "${srcdir}/usr/lib/app/resources/bin/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources/bin"
	install -Dm644 "${srcdir}/usr/share/applications/app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
	for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
}