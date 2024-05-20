# Maintainer: yifwon <wyf9661 at gmail dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bilibili-appimage"
pkgver=1.13.4
pkgrel=1
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
sha256sums_x86_64=('1fa447ce6eca7f34be50a2698053de22e3f15215d10f7cca3794bcbe281e4c56')
sha256sums_aarch64=('71e58cee0c2bfe011b043d54de30b535b373384b35c3a2d6d8d53c51d147ca32')
sha256sums_loong64=('8f0a67d45b42b5ebc90b18d76eac79b833c6b76454ae6bf96ca0e492e7d4bae3')
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
