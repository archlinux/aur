# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pennywise-bin
_pkgname=Pennywise
pkgver=0.8.0
_electronversion=5
pkgrel=8
pkgdesc="Cross-platform application to open any website or media in a floating window"
arch=('i686' 'x86_64')
url="https://github.com/kamranahmedse/pennywise"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'hicolor-icon-theme'
	"electron${_electronversion}"
)
optdepends=(
	'chromium: for Open with Pennywise Chrome extension'
	'google-chrome: for Open with Pennywise Chrome Extension'
	'firefox: for Open with Pennywise Firefox Add-on'
	'pepper-flash: for Adobe Flash support in Chromium'
	'flashplugin: for Adobe Flash support in Firefox'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=(
	"LICENSE-${pkgver}.md::https://raw.githubusercontent.com/kamranahmedse/pennywise/v${pkgver}/license.md"
	"${pkgname%-bin}.sh"
)
sha256sums=('b41ccd76edcf9e9af64581622b1d6dc1de7ed55a96548c4af8c43d32cd764b0b'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
sha256sums_i686=('df794adfb3fd28cb68beabe59cadfc000c0b20c83bb38f064d9409a7951b6799')
sha256sums_x86_64=('02d5f5ea3bf0b934d650cbb75c3cb43ab62b3d1c48c733b2f85816ccc8736191')
build() {
	sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
	bsdtar -xf "${srcdir}/data.tar.xz"
	sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/opt/${_pkgname}/resources/inspector" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}