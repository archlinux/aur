# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mater-bin
_pkgname=Mater
pkgver=1.0.10
_electronversion=11
pkgrel=6
pkgdesc="A simple menubar Pomodoro app"
arch=('x86_64')
url="https://github.com/jasonlong/mater"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('b26d8ef79fd92c95ac914e73af9504f06dcfaa204f62c47cc3d423a53fa32f8a'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    find "${srcdir}/${_pkgname}-linux-x64" -type d -exec chmod 755 {} \;
    find "${srcdir}/${_pkgname}-linux-x64/resources/app" -type f -exec chmod 644 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}