# Maintainer: diegul

pkgname=xpanel-desktop-bin
pkgver=1.0.7
pkgrel=3
pkgdesc="Electron wrapper for Finalmouse XPANEL (WebHID). Prebuilt AppImage."
arch=('x86_64')
url="https://github.com/diegul/xpanel-desktop"
license=('MIT')
depends=('glibc' 'gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils' 'fuse2')
provides=('xpanel-desktop')
conflicts=('xpanel-desktop')
options=('!strip')

source=(
  "https://github.com/diegul/xpanel-desktop/releases/latest/download/xpanel-desktop-linux-x86_64.AppImage"
  "xpanel-desktop.desktop"
  "xpanel-desktop.png"
)
sha256sums=('b9f43e078bf4672f402cf993fdb661052410cea5a90a7d60db9dbf0fcfc564b3' '6d3cc0c53b04ea6cd0bd89ce89c830b623a744befad12ec1f107ab8dec978be1' 'b3f9fa749782b671a36b26fa40df4ebae478e3398854c7f7a618c005a38f3718')

package() {
  install -d "$pkgdir/opt/xpanel-desktop"
  
  install -Dm755 "$srcdir/xpanel-desktop-linux-x86_64.AppImage" \
    "$pkgdir/opt/xpanel-desktop/xpanel-desktop.AppImage"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/xpanel-desktop" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

APPIMAGE="/opt/xpanel-desktop/xpanel-desktop.AppImage"

# Validate AppImage exists and is executable
if [[ ! -f "$APPIMAGE" ]]; then
    echo "Error: AppImage not found at $APPIMAGE" >&2
    exit 1
fi

if [[ ! -x "$APPIMAGE" ]]; then
    echo "Error: AppImage is not executable" >&2
    exit 1
fi

# Check if FUSE is available
if lsmod | grep -q "^fuse "; then
    # Try FUSE mounting first
    if "$APPIMAGE" "$@" 2>/dev/null; then
        exit 0
    fi
    echo "FUSE mounting failed, falling back to extraction..." >&2
fi

# Fallback to extraction method
exec "$APPIMAGE" --appimage-extract-and-run "$@"
EOF

  install -Dm644 "$srcdir/xpanel-desktop.desktop" \
    "$pkgdir/usr/share/applications/xpanel-desktop.desktop"
  install -Dm644 "$srcdir/xpanel-desktop.png" \
    "$pkgdir/usr/share/pixmaps/xpanel-desktop.png"
}