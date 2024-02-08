# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=warp-terminal
pkgver=0.2024.01.30.16.52.stable_01
pkgrel=1
pkgdesc="Warp is a modern, Rust-based terminal with AI built in so you and your team can build great software, faster"
arch=(x86_64)
url='https://warp.dev'
license=('LicenseRef-warp')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
source=(
    "${pkgname}-${pkgver}-$CARCH.AppImage::https://releases.warp.dev/stable/v${pkgver}/Warp-$CARCH.AppImage"
    "LICENSE::https://raw.githubusercontent.com/warpdotdev/Warp/main/LICENSE"
)
sha256sums=(
    "e370069d43435760aff645d658a24b8205cb36eb25ae8f3656cf36fa3c1d878b"
    "SKIP"
)

prepare() {
    cd "${srcdir}"
    chmod a+x "${pkgname}-${pkgver}-$CARCH.AppImage"
    "./${pkgname}-${pkgver}-$CARCH.AppImage" --appimage-extract >/dev/null
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-$CARCH.AppImage" "$pkgdir/opt/${pkgname}/${pkgname}.AppImage"
    cd ${srcdir}/squashfs-root/usr/share/icons
    find . -type f -exec install -Dm 644 {} "$pkgdir/usr/share/icons"/{} \;
    cd ${srcdir}/squashfs-root/usr/share/applications
    find . -type f -exec install -Dm 644 {} "$pkgdir/usr/share/applications"/{} \;
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/warp"
    install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
