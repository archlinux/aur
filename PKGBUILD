# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=duckstation-appimage
pkgver=20261107
pkgrel=1
pkgdesc="Fast PlayStation 1 emulator (upstream rolling AppImage, non-SSE2 x86_64)"
arch=('x86_64')
url="https://github.com/stenzek/duckstation"
license=('GPL-3.0-or-later')
depends=('fuse2' 'glibc')
optdepends=('gtk3: Qt-free desktop integration' 'libnotify: notifications')
provides=('duckstation')
conflicts=('duckstation' 'duckstation-qt-bin' 'duckstation-preview-latest-bin')
options=('!strip' '!debug')

# Rolling: always fetch the newest release (upstream tags it "latest").
source=("DuckStation-x64.AppImage::https://github.com/stenzek/duckstation/releases/latest/download/DuckStation-x64.AppImage")
sha256sums=('SKIP')

# Derive pkgver from the release publish date so the package version tracks
# upstream releases; makepkg re-runs this on every build.
pkgver() {
  curl -fsSL "https://api.github.com/repos/stenzek/duckstation/releases/latest" \
    | grep -o '"published_at": *"[^"]*"' | head -1 \
    | cut -d'"' -f4 | cut -d'T' -f1 | tr -d '-'
}

package() {
  # AppImage lives in /opt per FHS; standard paths get a wrapper + menu entry.
  install -Dm755 "$srcdir/DuckStation-x64.AppImage" \
    "$pkgdir/opt/duckstation/DuckStation-x64.AppImage"

  # Pull the upstream icon out of the squashfs (no FUSE needed for --appimage-extract).
  cd "$srcdir"
  chmod +x DuckStation-x64.AppImage
  ./DuckStation-x64.AppImage --appimage-extract >/dev/null 2>&1 || true
  local icon
  # App icon lives at squashfs root as org.duckstation.DuckStation.png.
  icon="$(find squashfs-root -maxdepth 1 -iname '*duckstation*.png' -o -maxdepth 1 -iname '*duckstation*.svg' 2>/dev/null | head -1)"
  case "$icon" in
    *.svg) install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/scalable/apps/duckstation.svg" ;;
    *.png) install -Dm644 "$icon" "$pkgdir/usr/share/pixmaps/duckstation.png" ;;
  esac
  rm -rf squashfs-root

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/duckstation" <<'EOF'
#!/bin/sh
exec /opt/duckstation/DuckStation-x64.AppImage "$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/duckstation.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=DuckStation
Comment=PlayStation 1 emulator
Exec=/usr/bin/duckstation %U
Icon=duckstation
Terminal=false
Categories=Game;Emulator;
Keywords=psx;ps1;playstation;emulator;
EOF
}
