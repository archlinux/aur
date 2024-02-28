# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=requestly-git
_pkgname=Requestly
pkgver=1.6.0.r0.gc5dfd15
_electronversion=23
_nodeversion=16
pkgrel=1
pkgdesc="Debug your network request across all platforms and browsers using a single app"
arch=('x86_64')
url="https://requestly.io/"
_ghurl="https://github.com/requestly/requestly-desktop-app"
_proxyurl="https://github.com/requestly/requestly-proxy"
license=('AGPL-3.0-only')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'hicolor-icon-theme'
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'git'
    'asar'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}-proxy::git+${_proxyurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'SKIP'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
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
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories="Development" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    cd "${srcdir}/${pkgname%-git}-proxy"
    npm install
    cd "${srcdir}/${pkgname//-/.}"
    cp -r assets release/app
    cp -r src/loadingScreen release/app
    npm install
    npm run package
    asar e "${srcdir}/${pkgname//-/.}/release/build/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname//-/.}/assets" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname//-/.}/src/loadingScreen" "${srcdir}/app.asar.unpacked/dist"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/release/build/linux-unpacked/resources/"{app.asar.unpacked,assets,static} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}