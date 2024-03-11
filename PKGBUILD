# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=rubick
pkgver=4.2.2
_electronversion=26
_nodeversion=16
pkgrel=2
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
	'base-devel'
)
source=(
	"${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
	"${pkgname}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
	nvm use "${_nodeversion}"
}
build() {
	sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
		-e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
	_ensure_local_nvm
	gendesk -q -f -n --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
	cd "${srcdir}/${pkgname}.git"
	export npm_config_build_from_source=true
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
	export ELECTRONVERSION="${_electronversion}"
	export npm_config_disturl=https://electronjs.org/headers
	HOME="${srcdir}/.electron-gyp"
	mkdir -p "${srcdir}/.electron-gyp"
	touch "${srcdir}/.electron-gyp/.yarnrc"
	sed -e '5i\  "homepage": "https://github.com/rubickCenter/rubick",' \
		-e '5i\  "repository": "https://github.com/rubickCenter/rubick",' \
		-i package.json
	sed -e "43,103d" -e "s|deb|AppImage|g" -i vue.config.js
	yarn install --cache-folder "${srcdir}/.yarn_cache"
	yarn global add xvfb-maybe @vue/cli
	cd "${srcdir}/${pkgname}.git/feature"
	yarn install --cache-folder "${srcdir}/.yarn_cache"
	yarn run build
	cd "${srcdir}/${pkgname}.git"
	yarn run release
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/build/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -r "${srcdir}/${pkgname}.git/build/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}.git/${pkgname}/public/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}