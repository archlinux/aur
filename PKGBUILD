# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=rubick-bin
pkgver=4.2.6
_electronversion=26
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubickcenter.github.io/rubick/"
_ghurl="https://github.com/rubickCenter/rubick"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	"electron${_electronversion}"
)
source=(
	"${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/rubickCenter/rubick/v${pkgver}/LICENSE"
	"${pkgname%-bin}.sh"
)
sha256sums=('8a8112a4c2f4f668bd43c5787cc83a2efd70ffee9752360d404927c438388633'
            '98ec3482acc93db8661b6a794744e5eaca088cf75312d15f196abb5db7e52b77'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
	sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
		-e "s|@cfgdirname@|${pkgname%-bin}|g" \
		-e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
	bsdtar -xf "${srcdir}/data."*
	sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package(){
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/2x2/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}