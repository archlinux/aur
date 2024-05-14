# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=orca
pkgname="${_appname}-writer"
_pkgname=Orca
pkgver=0.7.0_pre_alpha
_electronversion=18
_nodeversion=18
pkgrel=7
pkgdesc="React Electron App for Writing and Publishing Novels"
arch=('any')
url="https://orcawriter.app/"
_ghurl="https://github.com/zachhannum/orca"
license=('AGPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'yarn'
    'nvm'
    'gendesk'
    'base-devel'
    'gcc'
    'curl'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('e0f2857dc98cbe9d83d7633d950a281bdfd0cbe2ce18971a73593c1112778668'
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
        -e "s|@cfgdirname@|${_appname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${_appname}-writer" --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${_appname}-${pkgver//_/-}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
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
    sed "s|AppImage|dir|g" -i package.json
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver//_/-}/release/build/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${_appname}-${pkgver//_/-}/release/build/linux-"*/resources/{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 256x256 1024x1024;do
        install -Dm644 "${srcdir}/${_appname}-${pkgver//_/-}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}