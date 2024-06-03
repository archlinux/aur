# Maintainer: yifwon <wyf9661 at gmail dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bilibili-appimage"
pkgver=1.13.5
pkgrel=3
pkgdesc="Bilibili official desktop client.基于哔哩哔哩官方客户端移植的Linux版本,支持漫游"
arch=('x86_64' 'aarch64' 'loong64')
url="https://github.com/msojocs/bilibili-linux"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}-1/${pkgname%-appimage}-${pkgver}-x86_64.AppImage")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}-1/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_loong64=("${pkgname}-${pkgver}-loong64.AppImage::${url}/releases/download/v${pkgver}-1/${pkgname%-appimage}-${pkgver}-loong64.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/msojocs/bilibili-linux/master/license")
sha256sums_x86_64=('9c732e6a51dc672dff7c7efd20b190d14d707d225142e37abfccfb2dab88905f')
sha256sums_aarch64=('4a6ee69b5094b54ffd2c413effc68f896317b5b684c2fcfde258f4974bd562a8')
sha256sums_loong64=('ac59fb00ad1f8f5b2b3ca60236b9600db60a0f3e37bbf387cd20a457c0d72d7d')
sha256sums=('21668b8229199de1a523b82805c80d6e110a67fef5766aa7cc3c7df4416d1468')

_appimage="${pkgname}-${pkgver}-${CARCH}.AppImage"

prepare() {
    chmod a+x "${_appimage}"
    "./${_appimage}" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/bilibili.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${_appimage}" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
