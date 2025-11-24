# Maintainer: Dmitry <dimflix.official@gmail.com>
pkgname=pawlette-git
conflicts=('pawlette')
provides=('pawlette')
pkgver=r1.0.0
pkgrel=1
pkgdesc="😺 Utility for changing themes in the meowrch"
arch=('any')
url="https://github.com/meowrch/pawlette"
license=('GPL-3.0')
depends=('python')
makedepends=('python-uv' 'python-virtualenv' 'git')
options=('!debug')
source=("git+https://github.com/meowrch/pawlette.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pawlette"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/pawlette"

  # Install virtual environment
  install -d -m755 "$pkgdir/opt/$pkgname"
  python -m venv "$pkgdir/opt/$pkgname/.venv"
  uv sync --no-dev --frozen --compile-bytecode

  # Install application files
  cp -r . "$pkgdir/opt/$pkgname/"

  # Create launch script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pawlette" <<EOF
#!/bin/sh
cd /opt/pawlette-git
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
      config_file="$config_dir/pawlette.json"

      if [ ! -f "$config_file" ]; then
        echo "Creating default config for user $name"
        sudo -u "$name" mkdir -p "$config_dir"
        sudo -u "$name" /usr/bin/pawlette generate-config 2>/dev/null || true
      fi
    fi
  done

  echo "Pawlette installation completed!"
  echo "Configuration file: ~/.config/pawlette/pawlette.json"
  echo "Logs: journalctl -t pawlette"
}

post_upgrade() {
  post_install
}
