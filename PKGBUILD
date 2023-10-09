# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flexplayer
pkgver=1.0.0
pkgrel=1
pkgdesc="FlexPlayer plays multiple video files in a grid. FlexPlayer is a desktop application built in Electron."
arch=('x86_64')
url="https://github.com/ricmsd/flexplayer"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('gendesk' 'npm' 'nodejs>=18.17.1')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('d9e6c2dae1938aa6337ff7db9a5e548b2afad442b289717688c6c8675278b6a8'
            '7261077a05a935bc244f6d707e5690bad821858c27ddb452147d7f158c9c7b4e')
prepare() {
    gendesk -q -f --categories "AudioVideo" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}/player"
    npm install
    npm run build
    cd "${srcdir}/${pkgname}-${pkgver}/electron"
    sed '19,22d' -i forge.config.js
    npm install
    npm run forge:make
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/electron/out/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}