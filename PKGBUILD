# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mediachips-bin"
pkgver=0.11.3beta
pkgrel=3
pkgdesc="Manage your videos, add any metadata to them and play them."
arch=("x86_64")
url="https://mediachips.app/"
_githuburl="https://github.com/fupdec/mediaChips"
license=(GPL3)
depends=('hicolor-icon-theme' 'bash' 'electron17')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver%beta}-beta/MediaChips.v${pkgver%beta}.Linux.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('8af9d3e09bc812826e8c67908b2bfb7b6c638d70946cf45ae696f26b2e276610'
            'ace1a89143c9108967077403b6590c8431a11c84a1bf2f0ad0f051aec3b782be')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Utility|Utility;AudioVideo|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}