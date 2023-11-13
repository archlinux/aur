# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=rubick
pkgver=4.1.5
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubick.vip/"
_githuburl='https://github.com/rubickCenter/rubick'
license=('MIT')
conflicts=("${pkgname}")
depends=(
	'electron26'
	'python>=3'
)
makedepends=(
	'yarn'
	'nvm'
	'npm'
	'gendesk'
	'libxtst'
	'libxtst'
	'libicns'
	'graphicsmagick'
	'xz'
)
source=(
	"${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver}.zip"
	"${pkgname}.sh"
)
sha256sums=('43fd9b0ec01600dee9c9b604ce427fc6010066439f53944e32a446ce0f3c5123'
            'c519b9bf417913963385e0c9486951152c44834fa2d17d0fd924fabcedcddf03')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
	nvm use 16
}
build() {
	_ensure_local_nvm
	gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
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
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}