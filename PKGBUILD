# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=note-gen-bin
_pkgname=NoteGen
pkgver=0.19.8
pkgrel=1
pkgdesc="An AI notebook that focuses on recording and writing and is cross-platform.(Prebuilt version)一款专注于记录和写作的跨端AI笔记"
arch=('x86_64')
url="https://codexu.github.io/note-gen-help"
_ghurl="https://github.com/codexu/note-gen"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libpipewire'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgname%-bin}-v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/codexu/note-gen/${pkgname%-bin}-v${pkgver}/LICENSE"
)
sha256sums=('0ff88a71d8a453bc1495aff99317fa72ff57ad00595e3adb2deffcbadc75b56a'
            'c64e312ddcfe517655f9053eb1bb7a96f53c4c9487251475f32723dd85b91a92')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib/${_pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_pkgname}/icons" "${pkgdir}/usr/lib/${_pkgname}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
