# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=addressbook-desktop
_appname="Addressbook Desktop"
pkgver=1.2.0
pkgrel=2
pkgdesc="Backbone React/Redux/MUIv5 Electron Application"
arch=('any')
url="https://github.com/dredwardhyde/addressbook-desktop-app"
license=('Apache')
depends=('bash' 'electron23')
makedepends=('pnpm' 'gendesk' 'asar')
conflicts=("${pkgname}")
source=("${pkgname%}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.png"
    "${pkgname}.sh")
sha256sums=('03b21c99576b14cc1236a15bbc40c14b5d304a0a8399fe435ee7660dd51a9082'
            '69a031a39efb4564ee88f08d36cb5b606d99429ad77f47f967f88a6a4d40937f'
            '382a39b3cc36898cd0c587468350e9a2b5582db1fbf5b915a6eb5695e9786b5a')
build() {
    cd "${srcdir}/${pkgname%-bin}-app-${pkgver}"
    pnpm install --force
    pnpm run package
}
package() {
    asar pack "${srcdir}/${pkgname%-bin}-app-${pkgver}/out/${_appname}-linux-x64/resources/app" "${srcdir}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    gendesk -f --icon "${pkgname}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}