# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deadboltplusplus
pkgver=1.1.0
pkgrel=2
pkgdesc="An open source encryption app that is simple to use."
arch=('any')
url="https://github.com/maxturmult/deadboltplusplus"
license=('MIT')
conflicts=("${pkgname}" "${pkgname%plusplus}" "${pkgname//plus/+}")
depends=('bash' 'electron19')
makedepends=('npm' 'nodejs' 'gendesk' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('059dd6f1ef74b0bc175f60db1ac6ca615391a49289043a918696107ab4153eba'
            '970844900631a1eb32dcb5cb1b4f623dff37fa3df94fb3c4073038c7baf9f927')
build() {
    gendesk -f -n -q --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "s|deb|AppImage|g" -i package.json
    npm install
    npm run build
    npm run pack
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}