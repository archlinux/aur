# Maintainer: Da4ndo <contact@da4ndo.com>
pkgname=hyde-ext
pkgver=1.1.0
pkgrel=1
pkgdesc="Hyde-Ext is a Rust-based command-line application designed to enhance the HyDE (HyDE_CLI) environment. It automates tasks, installs essential tools, manages configurations, and restores settings from backups."
arch=('x86_64')
url="https://github.com/Da4ndo/Hyde-Ext"
license=('MIT')
source=("Hyde-Ext-$pkgver-x86_64.tar.gz::https://github.com/Da4ndo/Hyde-Ext/releases/download/v$pkgver/Hyde-Ext-v$pkgver-x86_64.tar.gz")
sha256sums=('SKIP')

pkgver() {
  local version=$(curl -s "https://api.github.com/repos/Da4ndo/Hyde-Ext/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
  if [[ -z "$version" ]]; then
    echo -e "\033[31mError:\033[0m Failed to fetch the latest version tag from GitHub." >&2
    exit 1
  else
    pkgver=${version#v}
    echo "$pkgver"
  fi
}

package() {
  cd "$srcdir"
  install -Dm755 "./$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Ensure the assets directory exists
  install -dm755 "$pkgdir/usr/share/$pkgname/assets"

  # Function to safely copy files with overwrite confirmation
  safe_copy() {
    local src=$1
    local dest=$2
    if [ -e "$dest" ]; then
      echo -e "\033[33mWarning: $dest exists. Overwriting...\033[0m"
    fi
    cp -rf "$src" "$dest"
  }

  # Copy all contents of the assets directory recursively, using safe_copy
  find "./assets/" -type f | while read -r file; do
    local rel_path="${file#./assets/}" # Extract relative path
    safe_copy "$file" "$pkgdir/usr/share/$pkgname/assets/$rel_path"
  done
}
