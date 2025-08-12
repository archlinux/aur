# Maintainer: terpinedream
pkgname=tuxagotchi-syu
pkgver=1.0.0
pkgrel=1
pkgdesc="A virtual pet that tracks your Arch Linux system updates"
arch=('any')
url="https://github.com/terpinedream/tuxagotchi-syu"
license=('GPL')
depends=('python' 'python-textual' 'python-rich' 'python-aiohttp' 'python-pygithub' 'python-toml' 'sudo' 'pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/terpinedream/tuxagotchi-syu/archive/v$pkgver.tar.gz")
sha256sums=('07623137055cb039e2996f674dcfb63ab062ff74b2e2e74a16b4b2a9fb9ddae2')

build() {
  return 0
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Create directories
  install -dm755 "$pkgdir/usr/share/$pkgname"

  # Copy application files
  cp -r textual_app "$pkgdir/usr/share/$pkgname/"
  if [ -d "assets" ]; then
    cp -r assets "$pkgdir/usr/share/$pkgname/"
    find "$pkgdir/usr/share/$pkgname/assets" -type f -exec chmod 644 {} \;
  fi

  # Install main Python files
  install -Dm644 config.py "$pkgdir/usr/share/$pkgname/config.py"
  install -Dm644 pacman.py "$pkgdir/usr/share/$pkgname/pacman.py"
  install -Dm644 requirements.txt "$pkgdir/usr/share/$pkgname/requirements.txt"

  # Install optional CSS
  if [ -f styles.css ]; then
    install -Dm644 styles.css "$pkgdir/usr/share/$pkgname/styles.css"
  fi

  # Launcher script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/tuxagotchi-syu" <<'EOF'
#!/bin/bash
CONFIG_DIR="$HOME/.config/tuxagotchi"
CONFIG_FILE="$CONFIG_DIR/config.toml"

if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
fi

if [ ! -f "$CONFIG_FILE" ]; then
    echo "First run detected. Creating config file at $CONFIG_FILE"
    cp "/usr/share/doc/tuxagotchi-syu/config.toml.example" "$CONFIG_FILE"
    echo ""
    echo "Configuration file created. The app will work with default settings."
    echo "For GitHub integration, edit $CONFIG_FILE with your credentials."
    echo ""
    echo "Starting Tuxagotchi..."
    sleep 2
fi

export TUXAGOTCHI_CONFIG_PATH="$CONFIG_FILE"
cd "/usr/share/tuxagotchi-syu"
exec python -m textual_app.app "$@"
EOF

  # Example config
  install -Dm644 config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml.example"

  # Desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Name=Tuxagotchi Syu
Comment=A virtual pet that tracks your Arch Linux system updates
Exec=tuxagotchi-syu
Icon=utilities-terminal
Terminal=true
Type=Application
Categories=System;Monitor;
Keywords=arch;linux;pacman;updates;monitoring;pet;tux;
EOF
}

# vim:set ts=2 sw=2 et:
