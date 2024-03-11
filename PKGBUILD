# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autorecord-manager
_pkgname="LAR 直播自动录制"
pkgver=4.6.1
_electronversion=20
_nodeversion=16
pkgrel=1
pkgdesc="基于 Electron 的多平台直播自动录制软件"
arch=('any')
url="https://github.com/WhiteMinds/LiveAutoRecord"
license=('LGPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'yarn'
    'git'
    'base-devel'
    'gcc'
)
options=(
    '!strip'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
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
    gendesk -f -n -q --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
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
    sed "s|electron-builder\",|electron-builder -l AppImage\",|g;s|\/\${version}||g" -i packages/electron/package.json
    # .yarnrc.yml existed
    yarn install #--cache-folder "${srcdir}/.yarn_cache"
    cd "${srcdir}/${pkgname}.git/packages/shared"
    yarn run build
    cd "${srcdir}/${pkgname}.git/packages/manager"
    yarn run build
    cd "${srcdir}/${pkgname}.git/packages/electron"
    yarn run app:build -p never
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/packages/electron/build/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/packages/electron/build/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/packages/electron/build/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}