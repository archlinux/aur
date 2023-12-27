# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=rubick
pkgver=4.2.1
_electronversion=26
_nodeversion=16
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubick.vip/"
_ghurl='https://github.com/rubickCenter/rubick'
license=('MIT')
conflicts=("${pkgname}")
depends=(
	"electron${_electronversion}"
	'python>=3'
)
makedepends=(
	'yarn'
	'nvm'
	'npm'
	'gendesk'
	'libxtst'
	'libicns'
	'graphicsmagick'
	'xz'
	'git'
)
source=(
	"${pkgname}::git+${_ghurl}.git#tag=v${pkgver}"
	"${pkgname}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
	nvm use "${_nodeversion}"
}
build() {
	sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
	_ensure_local_nvm
	gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
	cd "${srcdir}/${pkgname}"
	export npm_config_build_from_source=true
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	export ELECTRONVERSION="${_electronversion}"
	sed -e '5i\  "homepage": "https://github.com/rubickCenter/rubick",' \
		-e '5i\  "repository": "https://github.com/rubickCenter/rubick",' \
		-i package.json
	sed -e "42,98d" -e "s|deb|AppImage|g" -i vue.config.js
	yarn install --cache-folder "${srcdir}/.yarn_cache"
	yarn global add xvfb-maybe @vue/cli
	cd "${srcdir}/${pkgname}/feature"
	yarn install --cache-folder "${srcdir}/.yarn_cache"
	yarn build
	cd "${srcdir}/${pkgname}"
	npm run release
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/build/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -r "${srcdir}/${pkgname}/build/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/public/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}