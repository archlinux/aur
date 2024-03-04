# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=buttercup
pkgname="${_pkgname}-desktop-bin"
pkgver=2.26.0
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
    'hicolor-icon-theme'
)
makedepends=(
    'fuse2'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname//b/B}-linux-arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname//b/B}-linux-armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname//b/B}-linux-x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
sha256sums_aarch64=('bf911486cf3ac92b34550bfc4363ae412e6c0b8f51be0a256fed71625ae4f06f')
sha256sums_armv7h=('ed7bd00da202e18de7acb01ccb1f38a6b4cff2921cde21a2d90908fa0eb3c049')
sha256sums_x86_64=('7ec1f21e58c79367bfa71cf3ee362feb7f686f40fa813300dd4e0e5f16ef633f')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
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