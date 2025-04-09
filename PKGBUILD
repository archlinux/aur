# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wavy-bin
_pkgname=Wavy
pkgver=1.0.1
_electronversion=28
pkgrel=6
pkgdesc="A simple protocol testing tool that supports various connection types(now serial port only).(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/novrain/wavy"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${pkgname%-bin}-1.0.0-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/novrain/wavy/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b4015812bfa72fb8b453c1130291d3312b00a4b536ff3108967da574b9d402ca'
            '9f1a32e4c028facd2d42a3e5bb8c0bf6af386e3d48d2c205bb253694826f57be'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf "${srcdir}/usr/lib/${_pkgname}/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/"{android*,linux-arm*,darwin*,win32*}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}