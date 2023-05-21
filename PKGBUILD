# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="jimud-appimage"
pkgver=1.0.1
pkgrel=1
pkgdesc="MUD client for ShadowMUD.com, based on webclient"
arch=("x86_64")
url="http://www.shadowmud.com/"
_githuburl="https://github.com/icewolfz/jiMUD"
license=('custom')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
optdepends=()
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/jiMUD-${pkgver}.AppImage")
sha256sums=('7e24dce93e0d0501111539ad8a0991e9e3186dd4b0a19530354a09a65915693a')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/jimud.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}