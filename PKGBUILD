# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apple-music-bin
_pkgname='Apple Music'
pkgver=2.1.2
_electronversion=28
pkgrel=2
pkgdesc="An Electron app that provides a native Apple Music experience.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/Alex313031/apple-music-desktop"
license=('BSD-3-Clause')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'nspr'
    'nss'
    'alsa-lib'
    'gtk3'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_x64.rpm"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/Alex313031/apple-music-desktop/${pkgver}/LICENSE.md"
)
sha256sums=('4a9d3ca6512b5fe34372f5450a291b0b02dcee4af7df786bd95aaaa03986640d'
            '842db27e51c73f8ad8e9a72a64a4116c239fcad0939654a90c14d619ca22a435')
prepare() {
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" \
        "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}