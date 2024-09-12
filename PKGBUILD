# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=icalingua++-bin
pkgver=2.12.16
_electronversion=22
pkgrel=1
pkgdesc="A branch of deleted Icalingua, with limited support"
arch=(
    "aarch64"
    "armv7h"
    "x86_64"
)
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
license=("AGPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-electron"
)
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.asar::${url}/releases/download/v${pkgver}/app-arm64.asar")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.asar::${url}/releases/download/v${pkgver}/app-armv7l.asar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.asar::${url}/releases/download/v${pkgver}/app-x86_64.asar")
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Icalingua-plus-plus/Icalingua-plus-plus/develop/pkgres/512x512.png"
    "${pkgname%-bin}-${pkgver}.desktop::https://raw.githubusercontent.com/Icalingua-plus-plus/Icalingua-plus-plus/develop/pkgres/icalingua.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('5743ef3d19be5e41e83c3a1171a807cd0505d7f5d5f9c5abdff8926dccadc6de'
            'b088d20934708c53e50492694efefbf9a9dcb62fefb8d1d4976f36f32f84af86'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('c6a3a91ca66ca26d071ef3b849d08a600b159f05fe7acc9c38aa2679eb822bf3')
sha256sums_armv7h=('f72ff7e25175395a684cef4cb6d73c945234d0fdbb6fae7b94443bc40259773c')
sha256sums_x86_64=('1374b0ce517318099624a6e2fccf1941c0c48a8a39089fe7e17409659d2a7c82')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@//
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s/${pkgname%++-bin}.png/${pkgname%-bin}/;s/Exec=${pkgname%++-bin} %u/Exec=${pkgname%-bin} %U/" -i "${srcdir}/${pkgname%-bin}-${pkgver}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}