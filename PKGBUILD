# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=wallhaven
pkgname="unoffical-${_pkgname}-desktop-git"
_appname=Wallhaven
pkgver=1.0.4.r1.g064f455
_electronversion=17
pkgrel=1
pkgdesc="Wallhaven desktop app made with Electron + React + TypeScript"
arch=('any')
url="https://github.com/luisflorido/wallhaven-desktop"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'gendesk'
    'git'
    'nodejs'
    'npm'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n --categories="Utility" --pkgname="${pkgname%-git}" --name="${_appname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    npm install --force
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}.git/out/${_appname}-linux-"*/resources/{app,assets} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/assets/icon@2x.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}