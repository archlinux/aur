# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whispering-bin
_pkgname=Whispering
pkgver=7.8.0
pkgrel=1
pkgdesc="An open-source transcription application that provides global speech-to-text functionality, with options such as keyboard shortcuts and automatic copy and paste to make dictating as seamless as possible.(Prebuilt version)"
arch=('x86_64')
url="https://epicenter.so/"
_ghurl="https://github.com/epicenter-so/epicenter"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/epicenter-so/epicenter/v${pkgver}/LICENSE"
)
sha256sums=('3469302f0188287a1c2027af5ac6f0a0162a2bbedd806a5985a57a10ca5aa74d'
            '0b4eb79f55f8cb810c9b17fffa2c7823aed78b85d6d290e939e4c53511414c9d')
prepare() {
    sed -i -e "
        3i\Comment=${pkgdesc}/g
        s/Exec=app/Exec=${pkgname%-bin}/g
        s/Icon=app/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    #cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
