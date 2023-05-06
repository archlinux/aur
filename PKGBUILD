# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="superproductivity-appimage"
pkgver=7.13.2
pkgrel=1
pkgdesc="An advanced todo list app with integrated Timeboxing and time tracking capabilities. It also comes with integrations for Jira, Gitlab, GitHub and Open Project."
arch=("any")
url="http://super-productivity.com/"
_githuburl="https://github.com/johannesjo/super-productivity"
license=("MIT")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/superProductivity-${pkgver}.AppImage"
        "LICENSE::https://raw.githubusercontent.com/johannesjo/super-productivity/master/LICENSE")
sha256sums=('1f044952b35aa009cdb887035a05ce600f8fc4b8ce13a357449a883486d5c4ec'
            '2e279de19632b5694d24b0ac06fd5b837ec487bf821302d9ce195379850a5fcb')
      
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/superproductivity.AppImage|g;s|Productivity;|Productivity;Utility;|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}