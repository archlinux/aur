# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elevate-git
pkgver=6.17.0.r669.gba534053
_electronversion=17
pkgrel=1
pkgdesc="A sport app to 'Elevate' your training experience and goals! Track your fitness and progressions over time. Analyse deeper your activities. And more..."
arch=('any')
url="https://thomaschampagne.github.io/elevate-docs/"
_ghurl="https://github.com/thomaschampagne/elevate"
license=('MIT')
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
)
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    cd "${srcdir}/${pkgname%-git}"
    npm install
    cd "${srcdir}/${pkgname%-git}/desktop"
    npm run build:package:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/desktop/package/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/desktop/package/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/desktop/package/linux-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/swiftshader"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname%-git}/desktop/package/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}