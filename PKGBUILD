# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ringer-client-desktop
_pkgname=Ringer
pkgver=4.0.0
_electronversion=28
pkgrel=2
pkgdesc="A new cross platform messaging app"
arch=('any')
url="https://github.com/Lif-Platforms/Ringer-Client-Desktop"
license=('GPL-2.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python'
    'nodejs'
)
makedepends=(
    'npm'
    'git'
    'curl'
)
options=(
    '!strip'
)
source=(
    "${pkgname}.git::git+${url}#tag=${pkgver}"
    "${pkgname}.desktop"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '5ae75de25c7204dba7bfbbbe3c9f58cf6f565963359735a471e1f61ee8692181'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    sed "s|win|linux|g;s|nsis|AppImage|g;s|app-icon.ico|logo512.png|g" -i package.json
    npm install
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/public/logo512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}