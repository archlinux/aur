# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ytm-dlp-gui
pkgver=1.0.4
pkgrel=1
pkgdesc="An ElectronJS app for downloading music off Youtube Music."
arch=('x86_64')
url="https://github.com/RENOMIZER/ytm-dlp-gui"
license=('ISC')
conflicts=("${pkgname}")
depends=(
    'electron26'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
    'imagemagick'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8a6d09a6056bcb4c8144ead0d664f731325f08c3487ed57a32a3de0422ff9062')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed '46,49d' -i forge.config.js
    npm install --cache "${srcdir}/npm-cache" 
    npm run package
    convert "${srcdir}/${pkgname}-${pkgver}/src/images/icon.ico" "${srcdir}/${pkgname}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-0.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}