# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=grx-bin
_appname=GRX
pkgver=3.3.4
_electronversion=32
pkgrel=2
pkgdesc="Fastest Web Gerber Renderer.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://grx.electronicloud.app/"
_ghurl="https://github.com/hpcreery/GRX"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/hpcreery/GRX/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('de4c00fbfce06fba64a8615964e2ec93a5abe375e6668ee0ed68f126bfcff96b'
            '6af73551667116d187b1a4e5dac0933f99a4c1151bd1a44c12249cd540a69444'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_appname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}