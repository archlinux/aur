# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=rubick
pkgver=4.2.2
_electronversion=26
_nodeversion=16
pkgrel=3
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
	'curl'
	'base-devel'
	'gcc'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.sh"
)
sha256sums=('2e45eecb9b2736b83fc8d26c932b350ee141722a3d4f9e2bb40f819194dc3389'
            '41b6d61dffef064762b3eec3dfeca7a3e1f57cbcb6dce9a6940c06797a0eae9d')
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
		-e "s|@cfgdirname@|${pkgname}|g" \
		-e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
	_ensure_local_nvm
	gendesk -q -f -n --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
	cd "${srcdir}/${pkgname}-${pkgver}"
	export npm_config_build_from_source=true
	#export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	#export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	#export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
	#export ELECTRONVERSION="${_electronversion}"
	HOME="${srcdir}/.electron-gyp"
	mkdir -p "${srcdir}/.electron-gyp"
	touch "${srcdir}/.electron-gyp/.yarnrc"
	if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
		export npm_config_registry=https://registry.npmmirror.com
		export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
		export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
		export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
	else
		echo "Your network is OK."
	fi
	sed "s|deb|dir|g" -i vue.config.js
	yarn install --cache-folder "${srcdir}/.yarn_cache"
	yarn global add xvfb-maybe @vue/cli
	cd "${srcdir}/${pkgname}-${pkgver}/feature"
	yarn install --cache-folder "${srcdir}/.yarn_cache"
	npm run build
	cd "${srcdir}/${pkgname}-${pkgver}"
	npm run release
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}.git/${pkgname}/public/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}