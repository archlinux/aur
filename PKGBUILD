# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=dnschanger
pkgname="${_appname}-desktop-bin"
_pkgname=DNS-Changer
pkgver=2.3.4
_electronversion=33
pkgrel=1
pkgdesc="Gather the best DNS servers in a secure application.(Prebuilt version.Use system-wide electron)"
arch=("x86_64")
url="https://dnschanger.github.io/"
_ghurl="https://github.com/DnsChanger/dnsChanger-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-${CARCH}-${pkgver}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/DnsChanger/dnsChanger-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5fde90159cc1444187e2de42aef02b4ed4e1df713919dd6b184e0bc8845e7d3b'
            'd8cd7d03b1c407ad97d6059dd8d6821ce42ab3bd8e9d39caab2fe4e730c8f737'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${_pkgname//-/ }\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/Utilities/Utility;Network/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}