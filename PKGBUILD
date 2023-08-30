# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pomotro
_pkgname="${pkgname//p/P}"
pkgver=1.1
pkgrel=1
pkgdesc="A Desktop Pomodoro Clock"
arch=('x86_64')
url="https://github.com/Ranork/Pomotro"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'nodejs' 'npm' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('ece2bec903b745285f459bf8a4a1d4a70af531e10bac7d8d50c6f9701724e0b8'
            'fbb5b727c29434095c350c36a5a4b05f85a11a727b6857c6b35bc034885b72bd')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    yarn install
    sed "s|win32 --arch=x64|linux AppImage|g" -i package.json
    yarn build
    asar pack "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}-linux-x64/resources/app" "${srcdir}/${pkgname}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname}"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}