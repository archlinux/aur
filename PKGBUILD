# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>

pkgname=win11-clipboard-history-git
pkgver=r99.14e87d8
pkgrel=1
pkgdesc="Windows 11 style clipboard history manager for Linux"
arch=('x86_64')
url="https://github.com/gustavosett/Windows-11-Clipboard-History-For-Linux"
license=('MIT')

depends=(
  'glibc'
  'webkit2gtk'
)

makedepends=(
  'git'
  'rust'
  'cargo'
  'nodejs'
  'npm'
)

provides=('win11-clipboard-history')
conflicts=('win11-clipboard-history')

source=(
  "git+https://github.com/gustavosett/Windows-11-Clipboard-History-For-Linux.git"
  "win11-clipboard-history.desktop"
  "win11-clipboard-history.service"
)

sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/Windows-11-Clipboard-History-For-Linux"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Windows-11-Clipboard-History-For-Linux"

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/cargo-target"

  npm install --no-audit --no-fund --silent
  npm run build --silent

  cd src-tauri
  cargo build --release --locked
}

package() {
  cd "$srcdir/Windows-11-Clipboard-History-For-Linux/src-tauri"

  _bin="$(find target/release -maxdepth 1 -type f -executable \
          ! -name '*.so' ! -name 'build-script-*' \
          -printf '%s %p\n' | sort -nr | awk 'NR==1{print $2}')"

  if [[ -z "$_bin" ]]; then
    echo "ERROR: Tauri binary not found"
    exit 1
  fi

  install -Dm755 "$_bin" \
    "$pkgdir/usr/bin/win11-clipboard-history"

  install -Dm644 "$srcdir/win11-clipboard-history.desktop" \
    "$pkgdir/usr/share/applications/win11-clipboard-history.desktop"

  install -Dm644 "$srcdir/win11-clipboard-history.service" \
    "$pkgdir/usr/lib/systemd/user/win11-clipboard-history.service"
}
