# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer :  Biginoz
# Contributor :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Mélanie Chauvel (ariasuni) <perso@hack-libre.org>
pkgname=whalebird-bin
_pkgname=Whalebird
pkgver=6.2.2
_electronversion=34
pkgrel=1
pkgdesc="Single-column Fediverse client for desktop.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://whalebird.social/"
_ghurl="https://github.com/h3poteto/whalebird-desktop"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('653cc708e22f8d868da096295328adf031d8243dd216394d07f17f0eb29ca677'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t"${pkgdir}/usr/share/pixmaps"
}