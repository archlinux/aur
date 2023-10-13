# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=rubick
pkgver=4.0.1
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubick.vip/"
_githuburl='https://github.com/rubickCenter/rubick'
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('yarn' 'nodejs>=16' 'npm' 'gendesk' 'libxtst' 'libxtst' 'libicns' 'graphicsmagick' 'xz' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.sh")
sha256sums=('b289a37a181273e5e032c494c83c03cbed802852c78b12baf6eb73e1576daf96'
            '087d0ff408d5f0f270b36c65e5e1e5d27b277017b2091df08b0502cdebacb633')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -e '5i\  "homepage": "https://github.com/rubickCenter/rubick",' \
		-e '5i\  "repository": "https://github.com/rubickCenter/rubick",' \
		-i package.json
	sed "42,98d" -i vue.config.js
	yarn
	yarn add xvfb-maybe @vue/cli
	cd "${srcdir}/${pkgname}-${pkgver}/feature"
	yarn
	yarn build
	cd "${srcdir}/${pkgname}-${pkgver}"
	yarn electron:build
	asar e "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
	cp -r "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
	asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}