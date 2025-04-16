# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mudlet-bin
_pkgname=Mudlet
pkgver=4.19.1
pkgrel=1
pkgdesc="⚔️ A cross-platform, open source, and super fast MUD client with scripting in Lua.(Prebuilt version)"
arch=('x86_64')
url="https://www.mudlet.org"
_ghurl="https://github.com/Mudlet/Mudlet"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-multimedia'
    'hunspell'
    'libzip'
    'glu'
    'lua51-filesystem'
    'luazip5.1'
    'lua51-sql-sqlite'
    'lrexlib-pcre5.1'
    'qt5-gamepad'
    'lua51-luautf8'
    'ttf-font'
    'pugixml'
    'lua-yajl'
    'qtkeychain-qt5'
    'lua51-lcf'
)
makedepends=(
    'fuse2'
)
optdepends=(
    'ttf-bitstream-vera: default font'
    'ttf-ubuntu-font-family: default font'
    'noto-fonts-emoji: emoji font support'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar::${url}/wp-content/files/${_pkgname}-${pkgver}-linux-x64.AppImage.tar"
    "${pkgname%-bin}.sh"
)
sha256sums=('f2946b2b03c9d4ad3b0943313c211160909f8723216d33927efadb89aa18463f'
            'e002b010a25f31d5659799cbcbcecfc25a23e8b16dedf184726d3a7aa812bd79')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${_pkgname}.AppImage" ]; then
        chmod +x "${srcdir}/${_pkgname}.AppImage"
    fi
    "${srcdir}/${_pkgname%-bin}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}