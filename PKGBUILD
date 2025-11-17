# Maintainer: mewset>
pkgname=better-iptv-bin
pkgver=2.0.1
pkgrel=3
pkgdesc="Modern, powerful IPTV player for Linux, Windows, and macOS"
arch=('x86_64')
url="https://github.com/mewset/better-iptv"
license=('GPL2')
depends=('mpv' 'webkit2gtk' 'gtk3')
provides=('better-iptv')
conflicts=('better-iptv' 'better-iptv-git')
source=("$pkgname-$pkgver.AppImage::https://github.com/mewset/better-iptv/releases/download/v${pkgver}/Better.IPTV_${pkgver}_amd64.AppImage")
sha256sums=('f35480c99262305aca9747d8993444428287043cd6a06b70dc52ade77f6226cf')
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

    # Create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/better-iptv" << 'EOF'
#!/bin/sh
# Fix EGL display issues on some systems
export WEBKIT_DISABLE_COMPOSITING_MODE=1
exec /opt/better-iptv-bin/AppRun "$@"
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
