# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gchat"
_pkgname=GChat
pkgver=1.0.1
pkgrel=1
pkgdesc="Unofficial Google Chat app"
arch=('x86_64')
url="https://github.com/dcrousso/GChat"
license=('MIT')
depends=('electron23' 'hicolor-icon-theme' 'bash')
mkdenpends=('npm' 'gendesk')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('6ac16d881642d156d9e3c01367edba538cde61efef2c46d07be0e504a42199bf'
            '0b1b93e2c58d96e499c0b7ede9fb8c84526b1535f2683448a7be4f3591574db8')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/${_pkgname}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    gendesk -f -n --icon "${pkgname}" --categories "Network" --name "${_pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}