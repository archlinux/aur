# Maintainer: Simon Brüggen <aur@m3t0r.de>
pkgname=kiri-moto-appimage
pkgver=4.1.9
pkgrel=1
pkgdesc="CAM suite generating G-code for CNC mills, routers, FDM printers, laser and water cutters, and more."
arch=(x86_64)
url="https://grid.space/"
license=('MIT')
provides=(kiri-moto)
depends=(glibc zlib hicolor-icon-theme)
options=(!strip) # stripping breaks AppImages
source=("https://github.com/GridSpace/grid-apps/releases/download/$pkgver/KiriMoto-linux-$CARCH.AppImage"
    "https://github.com/GridSpace/grid-apps/raw/refs/tags/$pkgver/license.md")
sha256sums=('6d94d40a931831d57ba2b9f1aecc8dd703251aa4aa07a615c6ef566c8536c9ed'
            '192fd42ad203e43b1b870ae7e2c2fe2b2a7842ac93c530d61d54099408727c9b')

prepare() {
    chmod +x "KiriMoto-linux-$CARCH.AppImage"
    cd "$srcdir"
    "../KiriMoto-linux-$CARCH.AppImage" --appimage-extract usr/share/icons &> /dev/null
    "../KiriMoto-linux-$CARCH.AppImage" --appimage-extract grid-apps.desktop &> /dev/null

    sed -i -E 's/Exec=AppRun.+/Exec=kiri-moto/;s/Icon=grid-apps/Icon=kiri-moto/' \
        "$srcdir/squashfs-root/grid-apps.desktop"
}

package() {
    install -Dm755 "KiriMoto-linux-$CARCH.AppImage" "$pkgdir/usr/bin/kiri-moto"
    install -Dm644 "license.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 \
        "$srcdir/squashfs-root/usr/share/icons/hicolor/0x0/apps/grid-apps.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/kiri-moto.png"
    install -Dm644 \
        "$srcdir/squashfs-root/grid-apps.desktop" \
        "$pkgdir/usr/share/applications/kiri-moto.desktop"
}
