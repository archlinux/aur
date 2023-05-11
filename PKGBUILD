# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="app-outlet-appimage"
pkgver=2.1.0
pkgrel=1
pkgdesc="A universal Linux app store"
arch=('x86_64')
url="http://appoutlet.github.io/"
_githuburl="https://github.com/AppOutlet/AppOutlet"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/App.Outlet-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/AppOutlet/AppOutlet/main/LICENSE")
sha256sums=('42c576adda4df43130887fdc6f0a3d0b1579bf56e743be2a27a6816c785415e9'
            'c24c91646674659de06c8dad229b589608a69be9403433b4b5efe856db4cecb8')

prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/app-outlet.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
