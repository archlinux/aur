pkgname=updaterv2
pkgver=5.36
pkgrel=5
pkgdesc="This is an updater."
arch=('x86_64')
url="https://test.com"
license=('MIT')
depends=('bash' 'jq')
source=("https://github.com/shadowfreddy25551/testpackage/archive/refs/heads/main.zip")
sha256sums=('SKIP')

build() {
  echo "Listing files in $srcdir/testpackage-main before chmod:"
  ls -l "$srcdir/testpackage-main"

  # Fallback for config.sh
  if [[ ! -f "$srcdir/testpackage-main/config.sh" ]]; then
    echo "config.sh missing in source dir, trying to copy fallback..."
    if [[ -f ./config.sh ]]; then
      cp ./config.sh "$srcdir/testpackage-main/config.sh"
    else
      echo "Local fallback config.sh missing, downloading from GitHub raw..."
      curl -fsSL "https://raw.githubusercontent.com/shadowfreddy25551/testpackage/refs/heads/main/config.sh" -o "$srcdir/testpackage-main/config.sh"
    fi
  fi

  # Fallback for code.sh
  if [[ ! -f "$srcdir/testpackage-main/code.sh" ]]; then
    echo "code.sh missing in source dir, trying to copy fallback..."
    if [[ -f ./code.sh ]]; then
      cp ./code.sh "$srcdir/testpackage-main/code.sh"
    else
      echo "Local fallback code.sh missing, downloading from GitHub raw..."
      curl -fsSL "https://raw.githubusercontent.com/shadowfreddy25551/testpackage/refs/heads/main/code.sh" -o "$srcdir/testpackage-main/code.sh"
    fi
  fi

  chmod +x "$srcdir/testpackage-main/code.sh"
  chmod +x "$srcdir/testpackage-main/config.sh"

  echo "To run the updater type 'updater'"
  sleep 3
}


package() {
  install -Dm755 "$srcdir/testpackage-main/code.sh" "$pkgdir/usr/bin/updater"
  install -Dm755 "$srcdir/testpackage-main/config.sh" "$pkgdir/usr/bin/updater-config"
}
