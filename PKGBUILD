# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: surefire <surefire at cryptomile dot net>
# Contributor wenLiangcan <boxeed at gmail dot com>
pkgname=keeweb-git
_pkgname=KeeWeb
pkgver=1.18.7.r37.gc1fda05c
_electronversion=13
_nodeversion=16
pkgrel=1
pkgdesc="Desktop password manager compatible with KeePass databases. (develop branch)"
arch=('any')
url="https://keeweb.info/"
_ghurl="https://github.com/keeweb/keeweb"
license=('MIT')
conflicts=(
	"${pkgname%-git}"
	"${pkgname%-git}-web"
	"${pkgname%-git}-devel"
	"${pkgname%-git}-desktop"
)
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}-bin"
	'libsecret'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'asar'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
	export npm_config_cache="${srcdir}/.npm_cache"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
	export ELECTRONVERSION="${_electronversion}"
	export npm_config_disturl=https://electronjs.org/headers
	HOME="${srcdir}/.electron-gyp"
	if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
		export npm_config_registry=https://registry.npmmirror.com
		export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
		export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
	else
		echo "Your network is OK."
	fi
	sed "s|'AppImage', 'snap', 'rpm'|'dir'|g" -i Gruntfile.js
	npm install
	npm run dev-desktop-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/tmp/desktop/${pkgname%-git}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/tmp/desktop/${pkgname%-git}-linux-"*/resources/node_modules "${pkgdir}/usr/lib/${pkgname%-git}"
	install -Dm644 "${srcdir}/${pkgname//-/.}/graphics/512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}