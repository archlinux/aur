# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vikunja-desktop-appimage
pkgver=0.20.3
pkgrel=1
pkgdesc="The open-source, self-hostable to-do app.Organize everything, on all platforms."
arch=('x86_64')
uarl="https://vikunja.io/"
_githuburl="https://github.com/go-vikunja/desktop"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://dl.vikunja.io/desktop/${pkgver}/Vikunja%20Desktop-${pkgver}.AppImage")
sha256sums=('905c55196f2fb3234d90a05cef16210def5c105b5a06826275f4832bdbde05c2')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/vikunja.AppImage|g;s|Productivity|Utility|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}