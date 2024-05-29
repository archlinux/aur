# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=rubick
pkgver=4.2.4
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
	'curl'
	'gcc'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.sh"
)
sha256sums=('1989d15008e67628fa6d5cef6369b85b2f6001589a08ad20083146327df5bf5d'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
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
	gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
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
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed "s|deb|dir|g" -i vue.config.js
	yarn install --cache-folder "${srcdir}/.yarn_cache"
	yarn global add xvfb-maybe @vue/cli
	cd "${srcdir}/${pkgname}-${pkgver}/feature"
	yarn install --cache-folder "${srcdir}/.yarn_cache"
	yarn run build
	cd "${srcdir}/${pkgname}-${pkgver}"
	yarn run release
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}.git/${pkgname}/public/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}