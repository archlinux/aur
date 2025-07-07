# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whispering-bin
_pkgname=Whispering
pkgver=7.0.0
pkgrel=1
pkgdesc="An open-source transcription application that provides global speech-to-text functionality, with options such as keyboard shortcuts and automatic copy and paste to make dictating as seamless as possible.(Prebuilt version)"
arch=('x86_64')
url="https://whispering.bradenwong.com/"
_ghurl="https://github.com/braden-w/whispering"
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
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/braden-w/whispering/v${pkgver}/LICENSE"
)
sha256sums=('afcd9444e2404a0f2580e4e461aff9916bd5f54b2a4287e732ccad1f446cbd5c'
            'c619bbe548615d39e9928c5f86dc1c3a76defc9f99e35273f539aad092fedb9a')
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