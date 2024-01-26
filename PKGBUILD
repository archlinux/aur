# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=net-player
_pkgname="${pkgname//-p/P}"
pkgver=1.5.0
_electronversion=13
_nodeversion=16
pkgrel=1
pkgdesc="A Subsonic based music player.基于Subsonic API的桌面端播放器"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Zhoucheng133/net-player"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'pnpm'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}.git"
    sed -e "s|mac|linux|g" -e "s|zip|AppImage|g" -i vue.config.js
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export npm_config_disturl=https://electronjs.org/headers
    export HOME="${srcdir}/.electron-gyp"
    yarn install #--cache-folder "${srcdir}/.yarn_cache" --production
    yarn electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    if [ "${CARCH}" == "aarch64" ];then
        _osarchdir=linux-arm64-unpacked
    elif [ "${CARCH}" == "x86_64" ];then
        _osarchdir=linux-unpacked
    fi
    install -Dm644 "${srcdir}/${pkgname}.git/dist_electron/${_osarchdir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname}/dist_electron/${_osarchdir}/resources/build" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist_electron/${_osarchdir}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}