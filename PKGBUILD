# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="neanes-appimage"
_subver=beta.20
pkgver="0.3.0${_subver}"
pkgrel=1
pkgdesc="A free and open source scorewriter for notating Byzantine chant in Byzantine notation."
arch=('x86_64')
url="https://danielgarthur.github.io/neanes/"
_githuburl="https://github.com/danielgarthur/neanes"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver%${_subver}}-${_subver}/Neanes-${pkgver%${_subver}}-${_subver}.AppImage")
sha256sums=('4310776a5ab3d115284956506602ca9bdbb588ef5289a5140b948f3c9895f7e7')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/neanes.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}