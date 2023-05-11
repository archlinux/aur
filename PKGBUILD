# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bilibili-appimage"
pkgver=1.10.1
pkgrel=1
pkgdesc="Bilibili official desktop client.基于哔哩哔哩官方客户端移植的Linux版本,支持漫游"
arch=('x86_64')
url="https://github.com/msojocs/bilibili-linux"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}-1/${pkgname%-appimage}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/msojocs/bilibili-linux/master/license")
sha256sums=('24ded14d3133b2cfe61ca1069055ddcfea1cb62d5a19d24b77587e296be2ab4f'
            '21668b8229199de1a523b82805c80d6e110a67fef5766aa7cc3c7df4416d1468')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/bilibili.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}