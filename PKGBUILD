# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=pocket-casts
pkgname="${_pkgname}-desktop-bin"
pkgver=0.9.0
_electronversion=33
pkgrel=1
pkgdesc="The Pocket Casts webapp, packaged for the Linux Desktop.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/felicianotech/pocket-casts-desktop-app"
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!strip'
    '!emptydirs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/felicianotech/pocket-casts-desktop-app/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5478e5a98666c41de828fb7f50c3ea53b05755b7bda7d11211c6b1406d3046ba'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('0f60bcbd649146931c95704761db9ff0d74b6241046764868cf53dd5229240ee')
sha256sums_x86_64=('82f42bea1ba0461e2704c244e8051cf9ff7d21de08577c3609a8f9de17f62397')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/${_pkgname} %U/${pkgname%-bin} %U/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}