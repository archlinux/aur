# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=aero
pkgname="${_appname}-browser"
_pkgname="AeroBrowser"
pkgver=0.2.2_alpha
_electronversion=23
_nodeversion=18
pkgrel=2
pkgdesc="A fast and lightweight web browser made with electron and react that allows you to navigate the Internet with ease."
arch=(
    'aarch64'
    'x86_64'
)
url="https://aero-mymeiy532-frostbreker.vercel.app/"
_ghurl="https://github.com/FrostBreker/Aero"
license=('MIT')
conflicts=(
    "${pkgname}"
)
provides=(
    "${pkgname}"
)
depends=(
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'git'
    'npm'
    'nvm'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver//_/-}"
)
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --comment "${pkgdesc}" --categories "Network" --pkgname "${_appname}-browser" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed "55i\                    \"arm64\"," -i electron-builder.json
    sed "s|https://www.google.fr/|about:blank|g" -i src/App.js
    npm install
    npm run electron:package:linux
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    case "${CARCH}" in
        aarch64)
            _osarch=linux-arm64-unpacked
        ;;
        armv7h)
            _osarch=linux-armv7l-unpacked
        ;;
        x86_64)
            _osarch=linux-unpacked
        ;;
    esac
    cp -r "${srcdir}/${pkgname}.git/dist/${_osarch}/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE.MD" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}