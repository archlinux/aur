# Maintainer: Iced-Coded <volkogon212@gmail.com>

pkgname=rootapp
pkgver=1.0.0
pkgrel=1
pkgdesc="Experimental build of Root app via AppImage"
arch=('x86_64' 'aarch64')
url="https://www.rootapp.com"
license=('Proprietary')
depends=('fuse')
options=(!strip)

source_x86_64=("Root-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage")
source_aarch64=("Root-aarch64.AppImage::https://installer.rootapp.com/installer/Linux/Arm64/Root.AppImage")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

validpgpkeys=('172B42B0ABB988FA22047C50B7165C356A3983D9')

prepare() {
    chmod +x "$srcdir/"*.AppImage
}

package() {
    install -Dm755 "$srcdir/"*.AppImage "$pkgdir/opt/$pkgname/$pkgname.AppImage"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$pkgname.AppImage" "$pkgdir/usr/bin/$pkgname"

    if command -v bsdtar >/dev/null 2>&1; then
        "$srcdir/"*.AppImage --appimage-extract > /dev/null 2>&1 || true
        find "$srcdir/squashfs-root" -type f -name '*.png' -exec install -Dm644 {} \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png" \; -quit
        rm -rf "$srcdir/squashfs-root"
    fi

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Root
Exec=$pkgname
Icon=$pkgname
Type=Application
Categories=Network;
EOF
}
