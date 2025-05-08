# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mdx-notes-bin
_pkgname=MDX.Notes
pkgver=1.0.3
pkgrel=2
pkgdesc="⛷ Cross-platform note-taking software, public layout editor, using MDX ⛷ 跨平台笔记软件，公众号排版编辑器，使用MDX来排版.(Prebuilt version)"
arch=('x86_64')
url="https://mdxnotes.com/"
_ghurl="https://github.com/maqi1520/mdx-notes"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('49a34a452f7a6ba91987dc5fa5da99ba390dd89612beee4eb252ba94209bf56d')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=tauri-app/Exec=${pkgname%-bin}/g
        s/Icon=tauri-app/Icon=${pkgname%-bin}/g
        s/Categories=Development/Categories=Utility/g
    " "${srcdir}/usr/share/applications/tauri-app.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/tauri-app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/tauri-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/tauri-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}