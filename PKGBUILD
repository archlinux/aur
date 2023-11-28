# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=buttercup
pkgname="${_pkgname}-desktop-bin"
pkgver=2.22.0
pkgrel=1
pkgdesc="Cross-Platform Passwords & Secrets Vault"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://buttercup.pw/"
_githuburl="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron22'
    'hicolor-icon-theme'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
makedepends=(
    'squashfuse'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname//b/B}-linux-arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname//b/B}-linux-armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname//b/B}-linux-x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('4faee38e8f06e72f7a742a2bd13bf3f374275b1b85fe0381dfb609a0bbc40bf2')
sha256sums_aarch64=('14dc1efb7c2d66d3f577cdf1d9b568130997c587a2c9841d056061f03cc18e3b')
sha256sums_armv7h=('c59020a3ec0ba23dcb61de5cc58cf3cb8976dbec29ec6b53c573b566cc312c0b')
sha256sums_x86_64=('fb642e3d08d2c1329c357c9aaead04e95eebeb7b39e22cce794bdeb611062160')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}