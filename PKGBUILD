# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=manga-you-know-desktop-bin
_pkgname=MangaYouKnow
pkgver=0.6.3
pkgrel=1
pkgdesc="A manga reader that allows you to read manga from multiple sources in one app.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/manga-you-know/desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/manga-you-know/desktop/v${pkgver}/LICENSE"
)
sha256sums=('39bfd8bbc6c1e83c59fdb71b4dea070f31d48f2f7a09d6f66f2c9383dd3f82a9'
            '4b6eed746e024f896169410a9e6963f2eea5fa8eca32368cc5abaa55e8437aab')
prepare() {
    sed -i -e "
        s/Comment=A manga app!/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
