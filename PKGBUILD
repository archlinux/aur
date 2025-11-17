# Maintainer: mewset>
pkgname=better-iptv-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Modern, powerful IPTV player for Linux, Windows, and macOS"
arch=('x86_64')
url="https://github.com/mewset/better-iptv"
license=('GPL2')
depends=('mpv' 'webkit2gtk' 'gtk3')
provides=('better-iptv')
conflicts=('better-iptv' 'better-iptv-git')
source=("$pkgname-$pkgver.AppImage::https://github.com/mewset/better-iptv/releases/download/v${pkgver}/better-iptv_${pkgver}_amd64.AppImage")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')
options=('!strip')

prepare() {
    # Extract AppImage
    chmod +x "$pkgname-$pkgver.AppImage"
    ./"$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
    # Install files
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r squashfs-root/* "$pkgdir/opt/$pkgname/"

    # Create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/better-iptv" << 'EOF'
#!/bin/sh
exec /opt/better-iptv-bin/AppRun "$@"
EOF
    chmod +x "$pkgdir/usr/bin/better-iptv"

    # Desktop entry
    install -Dm644 squashfs-root/better-iptv.desktop \
        "$pkgdir/usr/share/applications/better-iptv.desktop"

    # Icon
    install -Dm644 squashfs-root/better-iptv.png \
        "$pkgdir/usr/share/pixmaps/better-iptv.png"

    # Fix desktop entry paths
    sed -i "s|Exec=.*|Exec=/usr/bin/better-iptv|" \
        "$pkgdir/usr/share/applications/better-iptv.desktop"
    sed -i "s|Icon=.*|Icon=better-iptv|" \
        "$pkgdir/usr/share/applications/better-iptv.desktop"
}
