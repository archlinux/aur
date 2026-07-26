# Maintainer: PairUX Team <hello@pairux.com>
pkgname=pairux-bin
pkgver=0.9.38
pkgrel=1
pkgdesc="Collaborative screen sharing with remote control"
arch=('x86_64')
url="https://pairux.com"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'fuse2')
optdepends=(
  'xdg-desktop-portal: Wayland portal-based remote control support'
  'xdg-desktop-portal-kde: KDE Plasma Wayland portal backend'
  'xdg-desktop-portal-gnome: GNOME Wayland portal backend'
  'xdg-desktop-portal-wlr: wlroots-based Wayland portal backend'
  'ydotool: Wayland fallback input injection backend (requires ydotoold)'
)
provides=('pairux')
conflicts=('pairux' 'pairux-git')
options=('!strip')
source=("PairUX-${pkgver}.AppImage::https://github.com/profullstack/pairux.com/releases/download/v${pkgver}/PairUX-${pkgver}-x86_64.AppImage")
sha256sums=('310476d1e76162f854e83d14ed8752a5727ad24317dd61da43f0bcb119b9c183')

package() {
    cd "$srcdir"

    # Install AppImage
    install -Dm755 "PairUX-${pkgver}.AppImage" "$pkgdir/opt/pairux/pairux.AppImage"

    # Create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/pairux" << 'WRAPPER'
#!/bin/bash
export ELECTRON_DISABLE_SANDBOX=1
exec /opt/pairux/pairux.AppImage "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/pairux"

    # Create and install desktop file
    cat > "$srcdir/pairux.desktop" << 'DESKTOP'
[Desktop Entry]
Name=PairUX
Comment=Collaborative screen sharing with remote control
Exec=/opt/pairux/pairux.AppImage --no-sandbox %U
Icon=pairux
Type=Application
Categories=Network;RemoteAccess;
StartupWMClass=PairUX
DESKTOP
    install -Dm644 "$srcdir/pairux.desktop" "$pkgdir/usr/share/applications/pairux.desktop"

    # Extract and install icon from AppImage
    cd "$pkgdir/opt/pairux"
    ./pairux.AppImage --appimage-extract usr/share/icons/hicolor/512x512/apps/*.png 2>/dev/null || true
    if [ -f squashfs-root/usr/share/icons/hicolor/512x512/apps/*.png ]; then
        install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/*.png "$pkgdir/usr/share/pixmaps/pairux.png"
    fi
    rm -rf squashfs-root
}
