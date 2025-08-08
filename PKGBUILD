# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=rubick
pkgver=4.3.5
_electronversion=26
_nodeversion=18
pkgrel=1
pkgdesc="🔧Electron based open source toolbox, free integration of rich plug-ins.(Use system-wide electron) 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubick.vip/"
_ghurl="https://github.com/rubickCenter/rubick"
license=('MIT')
conflicts=("${pkgname}")
depends=(
	"electron${_electronversion}"
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
	'git'
)
source=(
	"${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
	"${pkgname}.sh"
)
sha256sums=('d8dacb565018a3ae31d3c0cef478663ae6aac698b38e51873e23d31c972b9e3f'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname}.sh"
	_ensure_local_nvm
	gendesk -q -f -n \
		--pkgname="${pkgname}" \
		--pkgdesc="${pkgdesc}" \
		--categories="Utility" \
		--name="${pkgname}" \
		--exec="${pkgname} %U"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	HOME="${srcdir}/.electron-gyp"
	mkdir -p "${srcdir}/.electron-gyp"
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			echo -e '\n'
			echo 'registry "https://registry.npmmirror.com"'
			echo 'electron_mirror "https://registry.npmmirror.com/-/binary/electron/"'
			echo 'electron_builder_binaries_mirror "https://registry.npmmirror.com/-/binary/electron-builder-binaries/"'
			echo "cacheFolder "${srcdir}"/.yarn/cache"
			echo "pluginsFolder "${srcdir}"/.yarn/plugins"
			echo "globalFolder "${srcdir}"/.yarn/global"
			echo 'useHardlinks true'
			#echo 'buildFromSource true'
			echo 'linkWorkspacePackages true'
			echo 'fetchRetries 3'
			echo 'fetchRetryTimeout 10000'
			echo 'networkConcurrency 10'
		} >> .yarnrc
		find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
	fi
	cp .yarnrc feature
	sed -i "s/deb/dir/g" vue.config.js
	sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
	NODE_ENV=development 	yarn install --cache-folder "${srcdir}/.yarn_cache"
	NODE_ENV=development 	yarn global add -D xvfb-maybe @vue/cli
	cd "${srcdir}/${pkgname}-${pkgver}/feature"
	NODE_ENV=development 	yarn install --cache-folder "${srcdir}/.yarn_cache"
}
build() {
	local electronDist="/usr/lib/electron${_electronversion}"
	cd "${srcdir}/${pkgname}-${pkgver}/feature"
	NODE_ENV=production 	yarn run build
	cd "${srcdir}/${pkgname}-${pkgver}"
	NODE_ENV=production 	yarn run release
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}.git/${pkgname}/public/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
