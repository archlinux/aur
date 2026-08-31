# Maintainer: mewset
pkgname=better-iptv-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Modern, powerful IPTV player for Linux, Windows, and macOS"
arch=('x86_64')
url="https://github.com/mewset/better-iptv"
license=('GPL2')
depends=('mpv' 'webkit2gtk-4.1' 'gtk3')
provides=('better-iptv')
conflicts=('better-iptv' 'better-iptv-git')
# Use the Arch-compatible AppImage (without bundled WebKit libs)
source=("$pkgname-$pkgver.AppImage::https://github.com/mewset/better-iptv/releases/download/v${pkgver}/Better.IPTV_${pkgver}_amd64-arch.AppImage")
sha256sums=('1141355c2a75a96764ef045fff6995f1bd79bd64b2e83f947b6d030e7b88122c')
options=('!strip')

prepare() {
    # Extract AppImage
    chmod +x "$pkgname-$pkgver.AppImage"
    ./"$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
    cd "$srcdir"

    # Install files
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r squashfs-root/* "$pkgdir/opt/$pkgname/"

    # Fix executable permissions
    chmod +x "$pkgdir/opt/$pkgname/AppRun"
    chmod +x "$pkgdir/opt/$pkgname/AppRun.wrapped"

    # Create wrapper script that uses system libraries instead of bundled ones
    # This fixes EGL_BAD_PARAMETER crash on Arch/Manjaro with Wayland
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/better-iptv" << 'EOF'
#!/bin/sh
# Use system WebKit/GTK libraries instead of bundled Ubuntu libs
# This fixes EGL display initialization issues on Arch Linux
export LD_LIBRARY_PATH=/usr/lib
exec /opt/better-iptv-bin/usr/bin/better-ip-tv "$@"
EOF
    chmod +x "$pkgdir/usr/bin/better-iptv"

    # Desktop entry
    install -Dm644 "squashfs-root/Better IPTV.desktop" \
        "$pkgdir/usr/share/applications/better-iptv.desktop"

    # Icon
    install -Dm644 "squashfs-root/Better IPTV.png" \
        "$pkgdir/usr/share/pixmaps/better-iptv.png"

    # Fix desktop entry paths
    sed -i "s|Exec=.*|Exec=/usr/bin/better-iptv|" \
        "$pkgdir/usr/share/applications/better-iptv.desktop"
    sed -i "s|Icon=.*|Icon=better-iptv|" \
        "$pkgdir/usr/share/applications/better-iptv.desktop"
}
