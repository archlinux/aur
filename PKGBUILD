# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pomotro
_pkgname=Pomotro
pkgver=1.1
pkgrel=2
pkgdesc="A Desktop Pomodoro Clock"
arch=('x86_64')
url="https://github.com/Ranork/Pomotro"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'nodejs' 'npm' 'yarn')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('3cb020ca6153c904dd152478b26a62220dc8ed57cba5f242e0246685d0b24fca'
            '0396669328b9559c7918b4341f34526b5d54bf5cb90b50a585f1f7a92cf6b430')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed "s|win32 --arch=x64|linux AppImage|g" -i package.json
    yarn
    yarn build
    asar p "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}-linux-x64/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}