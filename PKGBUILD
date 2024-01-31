# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=aero
pkgname="${_appname}-browser-git"
_pkgname="AeroBrowser"
pkgver=0.2.2.alpha.r32.gd2f1652
_electronversion=23
pkgrel=1
pkgdesc="A fast and lightweight web browser made with electron and react that allows you to navigate the Internet with ease."
arch=(
    'aarch64'
    'x86_64'
)
url="https://aero-mymeiy532-frostbreker.vercel.app/"
_ghurl="https://github.com/FrostBreker/AeroBrowser"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'python'
    'nodejs'
)
makedepends=(
    'gendesk'
    'git'
    'npm'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --categories "Network" --pkgname "${_appname}-browser-git" --name "${_pkgname}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    sed '62,65d;61s|,||g' -i electron-builder.json
    sed '47s|app.isPackaged|!app.isPackaged|g' -i build/electron.js
    sed "s|https://www.google.fr/|about:blank|g" -i src/App.js
    npm install
    npm run electron:package:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/{app.asar.unpacked,public} "${pkgdir}/usr/lib/${pkgname%-git}"
    for _icons in 32x32 64x64 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/public/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE.MD" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
