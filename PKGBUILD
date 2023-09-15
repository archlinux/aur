# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mediachips-bin
_pkgname=MediaChips
pkgver=0.11.3_beta
pkgrel=5
pkgdesc="Manage your videos, add any metadata to them and play them."
arch=("x86_64")
url="https://mediachips.app/"
_githuburl="https://github.com/fupdec/mediaChips"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'bash' 'electron17')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/${_pkgname}.v${pkgver%_beta}.Linux.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('8af9d3e09bc812826e8c67908b2bfb7b6c638d70946cf45ae696f26b2e276610'
            'ace1a89143c9108967077403b6590c8431a11c84a1bf2f0ad0f051aec3b782be')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|Utility|Utility;AudioVideo|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}