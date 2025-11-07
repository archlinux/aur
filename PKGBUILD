
# Maintainer: acidburnmonkey
pkgname=agemo
pkgver=2.2.1
pkgrel=3
pkgdesc="Agemo is a GUI for Hyprpaper, written in Python + Qt6"
arch=('any')
url="https://github.com/acidburnmonkey/agemo"
license=('GPL3')
depends=('uv' 'hyprpaper' 'hyprland')
source=("$pkgname-$pkgver.tar.gz::https://github.com/acidburnmonkey/agemo/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install everything to /usr/share/agemo
  install -dm755 "$pkgdir/usr/share/agemo"
  cp -r assets agemo.json *.py style.qss pyproject.toml uv.lock agemo.desktop "$pkgdir/usr/share/agemo"

  # Install icon if available
  install -Dm644 assets/agemo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/agemo.svg"

  # Install wrapper to /usr/bin/agemo
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/agemo" <<'EOF'
#!/bin/bash

DEST="$HOME/.local/share/agemo"
DESKTOP="$HOME/.local/share/applications/agemo.desktop"

if [ ! -d "$DEST" ]; then
  echo "[agemo] First run: installing to $DEST"
  mkdir -p "$DEST"
  cp -r /usr/share/agemo/* "$DEST"
  chmod +x "$DEST/agemo.py"

  mkdir -p "$(dirname "$DESKTOP")"
  cat > "$DESKTOP" <<EOF_EOF
[Desktop Entry]
Type=Application
Version=2.2.1
Name=Agemo
Comment=Wallpaper GUI
Path=$DEST
Exec=/usr/bin/env uv run --project . agemo.py
Icon=$DEST/assets/agemo.svg
Terminal=false
Keywords=wallpaper;hyprpaper
Categories=Utility;
EOF_EOF
  echo "[agemo] Desktop shortcut created at $DESKTOP"
fi

cd "$DEST"
exec uv run --project . agemo.py "$@"
EOF
}


