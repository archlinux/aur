# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=listen1
pkgname="${_pkgname}-desktop-bin"
_appname=Listen1
pkgver=2.32.0
_electronversion=13
pkgrel=4
pkgdesc="One for all free music in China.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="http://listen1.github.io/listen1"
_ghurl="https://github.com/listen1/listen1_desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
    "${_pkgname}-electron"
)
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-desktop-bin}_${pkgver}_linux_amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/listen1/listen1_desktop/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('5ac63be98672a30850a97765e6474ea95ce0cb5a9330eee6d6d1db62860a1916'
            'd2aa8a82485042b9d5efb8ed2d9c0e8a66e8983bc3f64ebbe35158d35662cdbc'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_appname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Audio/AudioVideo/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}