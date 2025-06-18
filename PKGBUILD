# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=listen1
pkgname="${_pkgname}-desktop-bin"
_appname=Listen1
pkgver=2.33.0
_electronversion=32
pkgrel=1
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
sha256sums=('a4b5624bcd5d78ab749d2adef1afcf33425d24705172b4c99622cf04613afa43'
            'd2aa8a82485042b9d5efb8ed2d9c0e8a66e8983bc3f64ebbe35158d35662cdbc'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="strings ${srcdir}/opt/${_appname}/${_pkgname}  | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_appname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Audio/AudioVideo/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}