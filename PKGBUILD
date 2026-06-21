# Maintainer: Dmitry <dimflix.official@gmail.com>
pkgname=pawlette
conflicts=('pawlette-git' 'pawlette-git')
pkgver=2.0.0
pkgrel=1
pkgdesc="Modern theme manager for linux with template engine and dynamic theming"
arch=('any')
url="https://github.com/meowrch/pawlette"
license=('GPL-3.0')
depends=('python')
makedepends=('python-uv' 'python-hatchling' 'python-virtualenv' 'git')
options=('!debug')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7cc82761efaf5b70578d9c65609a0dc5797cc81ecb61a733bb341435ee1b242')

prepare() {
  echo "=== Checking for old pawlette version ==="

  # Проверяем установлен ли старый pawlette
  if pacman -Q pawlette &>/dev/null; then
    installed_ver=$(pacman -Q pawlette | awk '{print $2}' | cut -d'-' -f1 | cut -d':' -f2)
    echo "Found pawlette version: $installed_ver"

    # Если установлена версия < 2.0.0
    if [ "$(vercmp "$installed_ver" "2.0.0")" -lt 0 ]; then
      cat <<EOF
╔════════════════════════════════════════════════════════════╗
║              🔄 AUTO-MIGRATION TO PAWLETTE-LEGACY          ║
╠════════════════════════════════════════════════════════════╣
║  Detected pawlette v$installed_ver (old git-based version)          ║
║                                                            ║
║  Pawlette v2 is a complete rewrite with:                   ║
║  • Template engine (.pawlette files)                       ║
║  • Dynamic color extraction from wallpapers                ║
║  • Plugin system for extensibility                         ║
║                                                            ║
║  Your system will be migrated to pawlette-legacy.          ║
║  This ensures compatibility with meowrch < 3.1.0.          ║
╚════════════════════════════════════════════════════════════╝
EOF

      echo "Removing old pawlette..."
      sudo pacman -R pawlette

      echo "Installing pawlette-legacy..."

      # Устанавливаем legacy
      yay -S pawlette-legacy --noconfirm

      echo ""
      echo "✓ Migration complete! pawlette-legacy installed."
      echo ""
      echo "  Your themes and configs continue working."
      echo "  To upgrade to v2 later (requires meowrch 3.1.0+):"
      echo "    sudo pacman -R pawlette-legacy"
      echo "    yay -S pawlette"
      echo ""

      # Прерываем установку v2
      exit 1
    fi
  else
    echo "pawlette not installed, proceeding with v2 installation"
  fi
}

package() {
  cd "$srcdir/pawlette-$pkgver"

  # Install virtual environment
  install -d -m755 "$pkgdir/opt/$pkgname"
  python -m venv "$pkgdir/opt/$pkgname/.venv"
  uv sync --no-dev --frozen --compile-bytecode

  # Install application files
  cp -r . "$pkgdir/opt/$pkgname/"

  # Create launch script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pawlette" <<EOF
#!/bin/sh
cd /opt/pawlette
exec .venv/bin/python run.py "\$@"
EOF

  # Create log directory with proper permissions
  install -d -m755 "$pkgdir/var/log/pawlette"

  # Install systemd tmpfiles config to set correct ownership
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/pawlette.conf" <<EOF
d /var/log/pawlette 0755 - users -
EOF
}

post_install() {
  echo "Setting up pawlette configuration..."

  # Apply systemd tmpfiles configuration
  systemd-tmpfiles --create /usr/lib/tmpfiles.d/pawlette.conf

  # Create default config for all users if they don't have one
  getent passwd | while IFS=: read -r name _ uid _ _ home _; do
    # Skip system users (uid < 1000)
    if [ "$uid" -ge 1000 ] && [ -d "$home" ]; then
      config_dir="$home/.config/pawlette"
      config_file="$config_dir/pawlette.toml"

      if [ ! -f "$config_file" ]; then
        echo "Creating default config for user $name"
        sudo -u "$name" mkdir -p "$config_dir"
        sudo -u "$name" /usr/bin/pawlette generate-config 2>/dev/null || true
      fi
    fi
  done

  # Start migration
  pawlette migrate-from-v1

  echo "Pawlette installation completed!"
  echo "Configuration file: ~/.config/pawlette/pawlette.toml"
  echo "Logs: journalctl -t pawlette"
}

post_upgrade() {
  post_install
}
