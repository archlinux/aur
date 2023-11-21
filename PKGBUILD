# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flexplayer
_pkgname=FlexPlayer
pkgver=1.0.0
pkgrel=1
pkgdesc="Plays multiple video files in a grid,built in electron."
arch=('x86_64')
url="https://github.com/ricmsd/flexplayer"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron26'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs>=18.17.1'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}/#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '91fba4a72fb860bb18086f032a6000a8dece926edd28c7a07b033e6ffc382a41')
build() {
    gendesk -q -f --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}/player"
    npm install --cache "${srcdir}/npm-cache"
    npm run build
    cd "${srcdir}/${pkgname}-${pkgver}/electron"
    sed '19,22d' -i forge.config.js
    npm install --cache "${srcdir}/npm-cache"
    npm run forge:package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron/out/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}