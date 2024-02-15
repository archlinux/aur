# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=warp-terminal
pkgver=0.2024.02.14.15.46.stable_00
pkgrel=1
pkgdesc="Warp is a modern, Rust-based terminal with AI built in so you and your team can build great software, faster"
arch=(x86_64)
url='https://warp.dev'
license=('LicenseRef-warp')
depends=('hicolor-icon-theme' 'zlib' 'glibc' 'fuse2')
options=(!strip)
source=(
    "${pkgname}-${pkgver}-$CARCH.AppImage::https://releases.warp.dev/stable/v${pkgver}/Warp-$CARCH.AppImage"
    "LICENSE::https://raw.githubusercontent.com/warpdotdev/Warp/main/LICENSE"
)
sha256sums=(
    "260da2ed585d8090f569841fdb0bb327923d5cfe0bb57f61d3b0c413d5d634c2"
    "SKIP"
)

prepare() {
    cd "${srcdir}"
    chmod a+x "${pkgname}-${pkgver}-$CARCH.AppImage"
    "./${pkgname}-${pkgver}-$CARCH.AppImage" --appimage-extract >/dev/null
    cd ${srcdir}/squashfs-root/usr/share/applications
    sed -i 's/Exec=warp/Exec=warp-terminal/' dev.warp.Warp.desktop
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-$CARCH.AppImage" "$pkgdir/opt/${pkgname}/${pkgname}.AppImage"
    cd ${srcdir}/squashfs-root/usr/share/icons
    find . -type f -exec install -Dm 644 {} "$pkgdir/usr/share/icons"/{} \;
    cd ${srcdir}/squashfs-root/usr/share/applications
    find . -type f -exec install -Dm 644 {} "$pkgdir/usr/share/applications"/{} \;
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
