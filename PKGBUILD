# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=rubick
pkgver=4.0.7
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubick.vip/"
_githuburl='https://github.com/rubickCenter/rubick'
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('yarn' 'nvm' 'npm' 'gendesk' 'libxtst' 'libxtst' 'libicns' 'graphicsmagick' 'xz' 'asar')
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver}.zip"
	"${pkgname}.sh")
sha256sums=('11f4026559d03d980a969480d21a3e28e3f11769935213505177b7d0e18f2f2d'
            '18018cb5fb6b0bbfc438c4e66fa78491be0ca63cea30094670f039014e08005d')
_ensure_local_nvm() {
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}
build() {
	gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
	_ensure_local_nvm
	nvm install 16
	nvm use 16
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -e '5i\  "homepage": "https://github.com/rubickCenter/rubick",' \
		-e '5i\  "repository": "https://github.com/rubickCenter/rubick",' \
		-i package.json
	sed -e "42,98d" -e "s|deb|AppImage|g" -i vue.config.js
	yarn
	yarn global add xvfb-maybe @vue/cli
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