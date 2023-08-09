# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vnote-appimage
pkgver=3.16.0
pkgrel=3
pkgdesc="A pleasant note-taking platform."
arch=('x86_64')
url="https://app.vnote.fun/"
_githuburl="https://github.com/vnotex/vnote"
license=('LGPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-linux-x64_v${pkgver}.zip")
sha256sums=('99804e841ca73df2021fe2424612025234ebd768c65e1ca111f3134ae10483a8')
prepare() {
    mv "${srcdir}/${pkgname%-appimage}-linux-x64_v${pkgver}.AppImage" "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}