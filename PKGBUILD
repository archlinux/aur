# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=everytime
_pkgname=Everytime
pkgver=1.1.5
_electronversion=28
pkgrel=1
pkgdesc="Time zones are hard. Everytime makes them easy!"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/kiprobinson/everytime"
license=('Apache')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'npm'
    'gendesk'
    'git'
)
source=(
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}"
    sed -e "s|package-mac|package-linux|g" \
        -e "s|darwin|linux|g" \
        -e "s|icns|png|g" \
        -i package.json
    sed "s|icon.icns|icon.png|g;s|invert.ico|invert.png|g;s|icon.ico|icon.png|g" -i main.js
    cp icons/tray-icon-invert-hi-res.png icons/tray-icon-invert.png
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm install
    npm run package-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}/build/${_pkgname}-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}/icons/app-icon@3x.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}