# Maintainer: Martin P. <martinp6282@gmail.com>
# Contributor: Martin P. <martinp6282@gmail.com>

pkgname=bash-theft-auto
pkgver=2.5.1
pkgrel=1
pkgdesc="A GTA-like open world game in your terminal, made with bash scripting."
arch=('any')
url="https://github.com/stuffbymax/Bash-Theft-Auto"
license=('MIT')
depends=('bash' 'mpg123' 'bc' 'zip' 'unzip')
# Using the .tar.gz from the release tag you provided
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('477d4696f20602c6eae6b8aa7c225a3c30bb82220d7b154fa34c25f4e99aa835')

package() {
  cd "Bash-Theft-Auto-$pkgver"

  # 1. Install game assets to /usr/share
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r bta.sh music sfx "$pkgdir/usr/share/$pkgname/"
  chmod +x "$pkgdir/usr/share/$pkgname/bta.sh"

  # 2. Create a smart launcher
  # This script ensures the game runs from a writable directory so saves work
  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/bta"
#!/bin/bash
# Create local save directory if it doesn't exist
SAVE_DIR="\$HOME/.local/share/bash-theft-auto/saves"
mkdir -p "\$SAVE_DIR"

# Link the local saves into a temporary working environment or just run
# This game expects 'saves/' to be in the current working directory.
# We'll create a symlink in the user's home to handle this.
cd "/usr/share/$pkgname"

# Run the game
exec ./bta.sh "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/bta"

  # 3. Install License and Docs
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
