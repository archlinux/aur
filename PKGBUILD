# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=buttercup
pkgname="${_pkgname}-desktop-bin"
_appname=Buttercup
pkgver=2.28.0
_electronversion=22
pkgrel=1
pkgdesc="Cross-Platform Passwords & Secrets Vault"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://buttercup.pw/"
_ghurl="https://github.com/buttercup/buttercup-desktop"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_appname}-linux-arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}/${_appname}-linux-armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_appname}-linux-x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('c053a7b3ed8b0b4d77f78e81ab8a4c61cbfd773a9298b3f3a187e5df89c125c2')
sha256sums_aarch64=('c2aa84b1b7dbf9fdb79e3b92f523a8cbf7e554967812434971ec8d2c7ddc88fa')
sha256sums_armv7h=('b56a6df4a04944b63cd5291be35cb2e3ebc578066fbc5ac74c6a19a41c933aea')
sha256sums_x86_64=('0351e827d31d04f43d1cd90c3ce04a7b648414ca90d27c412dde9b854c91303f')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_appname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
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