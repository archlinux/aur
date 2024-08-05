# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=buttercup
pkgname="${_pkgname}-desktop-bin"
_appname=Buttercup
pkgver=2.28.0_7
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver//_/-}/${_appname}-linux-arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver//_/-}/${_appname}-linux-armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver//_/-}/${_appname}-linux-x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('2444c0895e33d0aac497e13c904bd82ff6cd80a389e9afa907b0be3420f3a7e0')
sha256sums_armv7h=('ee81ae1d6a9e0250386d553fb05756dbe6b66aae689b4f818c09429c1189fe67')
sha256sums_x86_64=('022a54e344d7c32c55d38cf44d64d5f463aa209d316afb5b6260f4baf53db91d')
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
_electronversion() {
    strings "${srcdir}/squashfs-root/${_pkgname}"  | grep '^Chrome/[0-9.]* Electron/[0-9]' | awk '{print $2}' | tr -d "Electron/" | sed 's|\.| |g' | awk '{print $1}'
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