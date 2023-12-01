# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=requestly-git
_pkgname=Requestly
pkgver=1.5.14.r0.g6504526
_electronversion=23
pkgrel=1
pkgdesc="Debug your network request across all platforms and browsers using a single app"
arch=('x86_64')
url="https://requestly.io/"
_ghurl="https://github.com/requestly/requestly-desktop-app"
license=('AGPL3')
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
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'aee747e38dba0960336c5b9839d04fd707097443b91e0cf202ee3a72e0b43bde')
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
    _ensure_local_nvm
    gendesk -f -n -q --categories "Development" --name "${_pkgname}" --exec "${pkgname%-git}"
    sed "s|@electronversion@|${_electronversion}|" -i "${srcdir}/${pkgname%-git}.sh"
    cd "${srcdir}/${pkgname%-git}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/npm_cache"
    npm install --cache "${srcdir}/npm-cache"
    npm run package
    asar e "${srcdir}/${pkgname%-git}/release/build/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname%-git}/assets" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname%-git}/src/loadingScreen" "${srcdir}/app.asar.unpacked/dist"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/release/build/linux-unpacked/resources/"{app.asar.unpacked,assets,static} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}