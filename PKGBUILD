pkgname=illogical-updots
pkgver=1.0.3
pkgrel=1
arch=('any')
url="https://github.com/FoxyIsCoding/illogical-updots"
license=('custom')
depends=('python' 'git' 'adwaita-icon-theme' 'gdk-pixbuf2' 'librsvg')
optdepends=('papirus-icon-theme: optional icon theme')
source=("https://github.com/FoxyIsCoding/illogical-updots/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  # Nothing to build; this is a script and resource package
  return 0
}

package() {
  # Extract everything to $pkgdir/usr/share/illogical-updots
  mkdir -p "$pkgdir/usr/share/illogical-updots"
  bsdtar -xf "$srcdir/main.tar.gz" -C "$pkgdir/usr/share/illogical-updots" --strip-components=1

  # Install launcher script that runs the app from /usr/share
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/illogical-updots" <<'EOF'
#!/usr/bin/env sh
exec python /usr/share/illogical-updots/app.py "$@"
EOF

  # Install icon
  install -Dm644 "$pkgdir/usr/share/illogical-updots/.github/assets/logo.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/illogical-updots.png"

  # Install desktop entry
  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/illogical-updots.desktop" <<EOF
[Desktop Entry]
Name=illogical-updots
Comment=Git updates & console installer for your dotfiles
Exec=illogical-updots
Icon=illogical-updots
Terminal=false
Type=Application
Categories=Utility;System;
StartupWMClass=illogical-updots
X-GNOME-UsesNotifications=true
EOF
}
