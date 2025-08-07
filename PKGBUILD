# Maintainer: terpinedream
pkgname=tuxagotchi
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal companion that thrives on GitHub commits with Cava integration"
arch=('any')
url="https://github.com/terpinedream/tuxagotchi"
license=('MIT')
depends=('python' 'python-textual' 'cava')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r textual_app assets *.py config.toml requirements.txt "$pkgdir/usr/lib/$pkgname"

  install -d "$pkgdir/usr/bin"
  cat <<'EOF' >"$pkgdir/usr/bin/tuxagotchi"
#!/bin/bash
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CONFIG_DIR="$XDG_CONFIG_HOME/tuxagotchi"
CONFIG_FILE="$CONFIG_DIR/config.toml"

# Create config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Copy config.toml if it doesn't already exist
if [[ ! -f "$CONFIG_FILE" ]]; then
  cp /usr/lib/tuxagotchi/config.toml "$CONFIG_FILE"
fi

# Run the application
cd /usr/lib/tuxagotchi
exec python3 -m textual_app.app
EOF
  chmod +x "$pkgdir/usr/bin/tuxagotchi"
}
