# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=switchhosts-git
pkgver=4.2.0.beta.r37.g4f10177
_electronversion=24
_nodeversion=18
pkgrel=1
pkgdesc="An app for managing hosts file,and switch hosts quickly!"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/oldj/SwitchHosts"
license=('Apache-2.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    #git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
    git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
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
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --pkgname="${pkgname%-git}" --name="SwitchHosts" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    sed '/deb:/d;s|app.icns|app.png|g;/npm.taobao.org/d' -i scripts/make.js
    npm install
    npm run build
    npm run make:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    case "${CARCH}" in
        x86_64)
            _architecture="linux-unpacked"
        ;;
        aarch64)
            _architecture="linux-arm64-unpacked"
        ;;
        armv7h)
            _architecture="linux-armv7l-unpacked"
        ;;
    esac
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/${_architecture}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}