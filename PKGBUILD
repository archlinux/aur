# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=buttercup-desktop-bin
pkgver=2.20.3
pkgrel=1
pkgdesc="Cross-Platform Passwords & Secrets Vault"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://buttercup.pw/"
_githuburl="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
conflits=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/Buttercup-linux-arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/Buttercup-linux-armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/Buttercup-linux-x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('a542d65f853688cde782a213642ef4c12d51734a28c314ea9ac993d7e9221344')
sha256sums_aarch64=('76b885a9aae1a3f708f7202372b1c434a27d755275c24709d270f850dfca07e8')
sha256sums_armv7h=('ab49db4be607384a38b5365f9d796ccb4a3b8387dec37e9b096dfabeb1de8ef8')
sha256sums_x86_64=('7bb0998c94a400090d9fbdd9ddc83e0f9494751781a7aa6acfbccaadb907b37f')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-desktop-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${pkgname%-desktop-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-desktop-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-desktop-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}