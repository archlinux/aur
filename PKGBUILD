# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="netpad-appimage"
pkgver=0.1.1
pkgrel=2
pkgdesc="A cross-platform C# editor and playground."
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=('MIT')
options=(!strip)
providers=(tareqimbasher)
conflits=("${pkgname%-appimage}")
_install_path="/opt/appimages" 
depends=('zlib' 'hicolor-icon-theme' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/netpad-${pkgver}-x86_64.AppImage"
    "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('3830437465a56059cf5c7aefa8801d5d9e880e15531fcb0d4e73f5380a011359'
            '43485534798b716310ae2a0edeebb00e97ff0e42e5fde13ff2994e2bc82348f6')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/netpad.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
