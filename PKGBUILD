# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=polar-bin
_pkgname=Polar
pkgver=3.2.0
_electronversion=13
pkgrel=2
pkgdesc="One-click Bitcoin Lightning networks for local app development & testing.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://lightningpolar.com/"
_ghurl="https://github.com/jamaljsr/polar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'docker'
    'docker-compose'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jamaljsr/polar/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('34f9527f8ee821842e8cbb6273f8fbaa8637bbbec8e3d628f9be34c7df6d3e0b'
            '971e947b52af09847d493b326953f2cbc91669441eab0d5e74eac38b8e162904'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}