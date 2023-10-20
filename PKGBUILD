# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=rubick-bin
pkgver=4.0.7
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubickcenter.github.io/rubick/"
_githuburl="https://github.com/rubickCenter/rubick"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/rubickCenter/rubick/v${pkgver}/LICENSE"
	"${pkgname%-bin}.sh")
sha256sums=('051211fe061b59c2d4407238c9ed47e859fc4e1c3897099ff6ee6074f72318dc'
            '98ec3482acc93db8661b6a794744e5eaca088cf75312d15f196abb5db7e52b77'
            '087d0ff408d5f0f270b36c65e5e1e5d27b277017b2091df08b0502cdebacb633')
build() {
	bsdtar -xf "${srcdir}/data.tar.xz"
	asar e "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
	unlink "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/extract-file-icon/build/node_gyp_bins/python3"
	cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${srcdir}"
	asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
	sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package(){
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}