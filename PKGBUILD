# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: j.r <j.r@jugendhacker.de>
pkgname=sonixd
_pkgname=Sonixd
pkgver=0.15.5
_electronversion=22
_nodeversion=16
pkgrel=4
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
	'base-devel'
    'gcc'
	'gendesk'
    'curl'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('1de05c325a0e86c24f1c917c33f577645481e898d842134e7d5f8e6650916d5e'
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
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Development" --name="${_pkgname}" --exec="${pkgname} %U"
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
    sed '/"AppImage",/d;s|"tar.xz"|"dir"|g' -i package.json
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run package
    asar e "${srcdir}/${pkgname}-${pkgver}/release/linux-"*/resources/app.asar "${srcdir}/app.asar.unpacked"
    sed "s|process.resourcesPath,\"assets\"|\"\/usr\/lib\/${pkgname%-bin}\",\"assets\"|g" -i "${srcdir}/app.asar.unpacked/main.prod.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/linux-"*/resources/{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname}"
	for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
    	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
	done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}