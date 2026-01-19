# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mogan-bin
_pkgname='Mogan STEM'
pkgver=2026.1.1
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
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-stem-v${pkgver}-debian13-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('851940c076c0d8a0f7a61047673de6e91cad451d193c862ee51b8ab0ccc949cd'
            'b3e9c2ea2115387e381b4f66d286e59c0ad4a16b94eed5313b03ce05fadc8863')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}stem/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=\/opt\/${pkgname%-bin}-stem\/bin\/${pkgname%-bin}stem/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname// /}/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/${pkgname%-bin}-stem/share/applications/${_pkgname// /}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/share"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}-stem/"{bin,lib,plugins,translations} \
        "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}-stem/share/"{doc,"${pkgname%-bin}"lab} \
        "${pkgdir}/usr/lib/${pkgname%-bin}/share"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}-stem/share/icons/hicolor/256x256/apps/${pkgname%-bin}-stem.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}-stem/share/icons/hicolor/512x512/apps/${_pkgname// /}.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}-stem/share/applications/${_pkgname// /}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
