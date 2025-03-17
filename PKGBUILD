# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=supalive-bin
_pkgname=Supalive
pkgver=0.0.35
_electronversion=27
pkgrel=6
pkgdesc="Aplicativo para alertas interativos em streaming, integrado com YouTube, Twitch e LivePix.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://supalive.app/"
_ghurl="https://github.com/SupaLive/supalive"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/SupaLive/supalive/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('bea7e2dc17fe742e896006d8dd1fe24e7c7d4d1d95df21d28454f2f818ad4c40'
            'ce9191ae1267b0c88407a86c56917e6d9776ea5b5a7590addc65063faa9e9df9'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/resources/icon.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}