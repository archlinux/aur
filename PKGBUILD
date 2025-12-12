# Maintainer: Burgess <burgess@ripvid.app>
pkgname=ripvid
pkgver=2.2.9
pkgrel=1
pkgdesc="Beautiful desktop app for downloading videos from YouTube, X/Twitter, TikTok, and 1000+ sites"
arch=('x86_64')
url="https://github.com/BurgessTG/ripVID"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'cairo'
    'gdk-pixbuf2'
    'glib2'
    'hicolor-icon-theme'
)
optdepends=(
    'libappindicator-gtk3: system tray support'
)
provides=('ripvid')
conflicts=('ripvid-bin' 'ripvid-git')
source=("${pkgname}-${pkgver}.deb::https://github.com/BurgessTG/ripVID/releases/download/v${pkgver}/ripVID_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    cd "$srcdir"

    # Extract deb package
    bsdtar -xf data.tar.* -C "$pkgdir"

    # Fix permissions
    chmod 755 "$pkgdir/usr/bin/"* 2>/dev/null || true

    # Create ripvid symlink (binary is named video-downloader)
    ln -sf video-downloader "$pkgdir/usr/bin/ripvid"

    # Fix Wayland crash (WebKitGTK compositing issue with Hyprland/Sway)
    sed -i 's|^Exec=video-downloader|Exec=env WEBKIT_DISABLE_COMPOSITING_MODE=1 video-downloader|' \
        "$pkgdir/usr/share/applications/ripVID.desktop"
}
