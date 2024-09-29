# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=rubick
pkgver=4.2.7
_electronversion=26
_nodeversion=18
pkgrel=1
pkgdesc="Electron based open source toolbox, free integration of rich plug-ins. 基于 electron 的开源工具箱，自由集成丰富插件。"
arch=('x86_64')
url="https://rubick.vip/"
_ghurl='https://github.com/rubickCenter/rubick'
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
	'gcc'
	'git'
)
source=(
	"${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
	"${pkgname}.sh"
)
sha256sums=('0742f0e2f943031a1a832a9634d83acd0fa0640b1f45ad52023a11c1f6aef6c4'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
	sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname}.sh"
	_ensure_local_nvm
	gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
	cd "${srcdir}/${pkgname}.git"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	HOME="${srcdir}/.electron-gyp"
	mkdir -p "${srcdir}/.electron-gyp"
	{
		if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
			echo -e '\n'
			echo 'registry "https://registry.npmmirror.com"'
			echo 'disturl "https://registry.npmmirror.com/-/binary/node/"'
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
		fi
	} >> .yarnrc
	cp .yarnrc feature
	sed -i "s/deb/dir/g" vue.config.js
	sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
	NODE_ENV=development 	yarn install --cache-folder "${srcdir}/.yarn_cache" --no-lockfile
	NODE_ENV=development 	yarn global add -D xvfb-maybe @vue/cli
	cd "${srcdir}/${pkgname}.git/feature"
	NODE_ENV=development 	yarn install --cache-folder "${srcdir}/.yarn_cache" --no-lockfile
	NODE_ENV=production 	npm run build
	cd "${srcdir}/${pkgname}.git"
	NODE_ENV=production 	npm run release
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/build/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -r "${srcdir}/${pkgname}.git/build/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}.git/${pkgname}/public/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}