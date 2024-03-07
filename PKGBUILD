# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sharefi-electron-bin
pkgver=0.4.1
_electronversion=24
pkgrel=6
pkgdesc="The sharefi app allows you to share files and folders through local network. It is fast, secure, free, easy to use and cross platform."
arch=("x86_64")
url="https://sharefi.app"
_ghurl="https://github.com/lucafornerone/sharefi-electron"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/download/v${pkgver}/linux/${pkgname%-electron-bin}-x64-v${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lucafornerone/sharefi-electron/release/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('2ce1343513f2f904c740a6f587ae65248cb22502556c4573050e4ba461cce475'
            '3355028d7d3f5a0da30ca17099cf8f9a6c833986cbad09ce930901b3379eb0fd'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}