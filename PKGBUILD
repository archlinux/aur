# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mogan-bin
_pkgname='Mogan STEM'
pkgver=2026.2.2
pkgrel=1
pkgdesc="A structured wysiwyg scientific text editor.(Prebuilt version)"
arch=('x86_64')
url="https://mogan.app/"
_ghurl="https://github.com/XmacsLabs/mogan"
_libgit2url="https://github.com/libgit2/libgit2"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gawk'
    'python-pillow'
    'freetype2'
    'python'
    'fontconfig'
    'libglvnd'
    'libx11'
    'qt6-base'
    'libxkbcommon'
    'fcitx5-qt'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-stem-v${pkgver}-debian13-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('4d703d1f76138e2ab005fb85020c6a5ab68c2587ad84a4b89aaa9ddfebb6795f'
            'b3e9c2ea2115387e381b4f66d286e59c0ad4a16b94eed5313b03ce05fadc8863')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}stem/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=\/opt\/${pkgname%-bin}-stem\/bin\/${pkgname%-bin}stem/Exec=${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-stem/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-stem.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/share"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}-stem/"{bin,lib,plugins,translations} \
        "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}-stem/share/"{doc,"${pkgname%-bin}"lab} \
        "${pkgdir}/usr/lib/${pkgname%-bin}/share"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-stem.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    _mime_types_size=(16x16 20x20 22x22 24x24 32x32 36x36 40x40 48x48 64x64 72x72 96x96 128x128 192x192 256x256 512x512)
    for _mt_size in "${_mime_types_size[@]}";do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_mt_size}/mimetypes/texmacs-document.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_mt_size}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-stem.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/mime/packages/texmacs.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}
