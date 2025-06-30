# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pakeplus-bin
_pkgname=PakePlus
pkgver=0.6.1
pkgrel=1
pkgdesc="Turn any webpage into a desktop app and mobile app with Rust.(Prebuilt version)利用 Rust 轻松构建轻量级(仅5M)多端桌面应用和多端手机应用"
arch=('x86_64')
url="https://pakeplus.com/"
_ghurl="https://github.com/Sjj1024/PakePlus"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Sjj1024/PakePlus/${_pkgname}-v${pkgver}/LICENSE"
)
sha256sums=('581c21eed9dd5dd42b7d77259607dc9ced19d81a05e8074050a7e05bbc210a3c'
            '2476bac4e033612ada3dfc61bae1166c1f5b90b58194f89c594eba3d8a408abf')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
