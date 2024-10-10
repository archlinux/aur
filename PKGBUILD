# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=interactive-data-editor-bin
_pkgname="Interactive Data Editor"
pkgver=2.13.1
_electronversion=17
pkgrel=7
pkgdesc="A Software to interactively edit data in a graphical manner"
arch=('x86_64')
url="https://koushikphy.github.io/Interactive_Data_Editor/"
_ghurl="https://github.com/Koushikphy/Interactive_Data_Editor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'nspr'
    'nss'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Koushikphy/Interactive_Data_Editor/v${pkgver}/LICENSE"
)
sha256sums=('b1cb88d8eb558d906c6a136991988e6f730a2791dcc2dd9f952b018827710ab7'
            'd728fec9e20c7c6b1528b62e2525c7f98d2f99061e5b8e3bbd33d27f27271265')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}