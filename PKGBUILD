# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nudge
_appname=Nudge
pkgver=0.4
pkgrel=2
pkgdesc="An electron-powered application focused on personal health"
arch=('any')
url="https://github.com/aasmart/Nudge"
license=('MIT')
conflicts=("${pkgname%}")
depends=('bash' 'electron23')
makedepends=('npm' 'gendesk' 'asar')
source=("${pkgname%}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%}".sh)
sha256sums=('81a65a4df587f7cfa05779c03c5a761f0de20ccb5b466fb19b1c78fae8a4b4dc'
            '08c979a31f87378ae6fe1d156a5d8bf7ca1a53bf7d81559fd2106fc1ab2bcdf4')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    chmod +x ./node_modules/.bin/electron-forge
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    asar pack "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/resources/app/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%}.png"
    gendesk -f -n --icon "${pkgname%}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%}.desktop" -t "${pkgdir}/usr/share/applications"
}