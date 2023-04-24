# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="vnote-appimage"
pkgver=3.16.0
pkgrel=2
pkgdesc="A pleasant note-taking platform."
arch=('x86_64')
url="https://app.vnote.fun/"
_githuburl="https://github.com/vnotex/vnote"
license=('LGPL3')
options=(!strip)
providers=("${pkgname%-appimager}x")
conflits=("${pkgname%-appimager}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimager}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimager}-linux-x64_v${pkgver}.zip")
sha256sums=('99804e841ca73df2021fe2424612025234ebd768c65e1ca111f3134ae10483a8')
   
prepare() {
    mv "${srcdir}/${pkgname%-appimager}-linux-x64_v${pkgver}.AppImage" "${srcdir}/${pkgname%-appimager}-${pkgver}.AppImage"
    chmod a+x "${pkgname%-appimager}-${pkgver}.AppImage"
    "./${pkgname%-appimager}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=vnote|Exec=/opt/appimages/vnote.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimager}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimager}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimager}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimager}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimager}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimager}.desktop" -t "${pkgdir}/usr/share/applications"
}