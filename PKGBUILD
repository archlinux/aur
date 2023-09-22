# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=agendapp
_pkgname=Agendapp
pkgver=1.0.0
pkgrel=1
pkgdesc="One of the best software to simplify school calendar management and facilitate classroom notes."
arch=('x86_64')
url="https://github.com/johan-perso/agendapp"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron20')
makedepends=('gendesk' 'npm' 'nodejs' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('12729576705f4bf9ef7eb98377801486de952adad61d3d6b6f094cbab3c0f282'
            '4ee53923ca6dc0f262f669c69224639eccb43884b29c0f6976c40e57abe750cd')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "s|-exe|-linux|g;s|win32|linux|g;s|icon.ico|icon.png|g;s|release-builds|dist|g" -i package.json
    npm install
    npm run build-linux
    asar p "${srcdir}/${pkgname}-${pkgver}/dist/${_pkgname}-linux-x64/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}