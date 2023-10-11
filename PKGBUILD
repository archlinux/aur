# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=addressbook-desktop
_appname="Addressbook Desktop"
pkgver=1.2.0
pkgrel=3
pkgdesc="Addressbook Desktop Application"
arch=('any')
url="https://github.com/dredwardhyde/addressbook-desktop-app"
license=('Apache')
depends=('bash' 'electron23')
makedepends=('npm' 'gendesk' 'asar' 'imagemagick')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('03b21c99576b14cc1236a15bbc40c14b5d304a0a8399fe435ee7660dd51a9082'
            'f820d348c118d37f88d49d81c62e6128a2277b5fa6e9d997153e636b507a74d4')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-app-${pkgver}"
    npm install --force
    npm run package
    asar pack "${srcdir}/${pkgname}-app-${pkgver}/out/${_appname}-linux-x64/resources/app" "${srcdir}/app.asar"
    convert "${srcdir}/${pkgname}-app-${pkgver}/assets/icon.ico" "${srcdir}/${pkgname}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}