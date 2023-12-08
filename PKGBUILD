# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kuro-git
_pkgname=Kuro
pkgver=9.0.0.r5.g0555720
_electronversion=22
pkgrel=1
pkgdesc="An elegant Microsoft ToDo desktop client for Linux (a fork of Ao)"
arch=('x86_64')
url="https://github.com/davidsmorais/kuro"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
)
source=(
    "${pkgname%-git}::git+${url}.git"
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
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    sed "s|--publish never|--linux AppImage --publish never|g" -i package.json
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}/build/icons/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/license.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}