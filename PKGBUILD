# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=agendapp
_pkgname=Agendapp
pkgver=1.2.0
pkgrel=2
pkgdesc="One of the best software to simplify school calendar management and facilitate classroom notes."
arch=('x86_64')
url="https://github.com/johan-perso/agendapp"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron20'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '4d657e85a04866535b3b1231730fc5d2d466221db61cafbbe25fca4b88cbee4c')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "s|-exe|-linux|g;s|win32|linux|g;s|icon.ico|icon.png|g;s|release-builds|dist|g" -i package.json
    npm install --cache "${srcdir}/npm-cache" 
    npm run build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}