# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=manga-you-know-desktop-bin
_pkgname=MangaYouKnow
pkgver=0.7.4
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
sha256sums=('e34bda3b51107bf61abe1a482c477580762adef77b9c8fb99c384677aae78f65'
            'aaecf4b84ef2c23ac6d770f6a233b44a89d9db4195934402c71680a4d0d07c4b')
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
