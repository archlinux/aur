# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: j.r <j.r@jugendhacker.de>
pkgname=sonixd
_pkgname=Sonixd
pkgver=0.15.5
_electronversion=22
_nodeversion=16
pkgrel=3
pkgdesc="A full-featured Subsonic/Jellyfin compatible desktop client"
arch=('x86_64')
url="https://github.com/jeffvli/sonixd"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
	"electron${_electronversion}"
)
makedepends=(
	'yarn'
	'nvm'
	'npm'
	'python>=3'
	'git'
	'base-devel'
	'gendesk'
)
source=(
	"${pkgname}.git::git+${url}#tag=v${pkgver}"
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
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Development" --name="${_pkgname}" --exec="${pkgname} %U"
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
    sed "s|electron-builder build|electron-builder -l AppImage|g" -i package.json
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run package
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/release/linux-"*/resources/{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname}"
	for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
    	install -Dm644 "${srcdir}/${pkgname}.git/assets/icons/${_icons}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
	done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}