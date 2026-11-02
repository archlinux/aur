# Maintainer: Natalie <natalie@localhost>

pkgname=mimick-git
pkgver=r0
pkgrel=1
pkgdesc="Unofficial Immich desktop client for Linux (GTK4/libadwaita)"
arch=('x86_64')
url="https://github.com/nicx17/mimick"
license=('GPL3')
depends=(
  'gtk4'
  'libadwaita'
  'libshumate'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'pkgconf'
  'meson'
  'ninja'
  'blueprint-compiler'
  'clang'
  'llvm'
  'libheif'
  'cmake'
  'base-devel'
)
optdepends=(
  'libsecret: keyring integration'
  'libnotify: notifications'
)
provides=('mimick')
conflicts=('mimick')
source=("${pkgname}::git+https://github.com/spivanatalie64/mimick.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/$pkgname"
  local log="$startdir/output.log"
  echo "=== STABILITY TESTING LOG - $(date) ===" > "$log"
  echo "--- Running cargo test --release --locked --workspace ---" >> "$log"
  if ! cargo test --release --locked --workspace >> "$log" 2>&1; then
    echo "" >> "$log"
    echo "=== TESTS FAILED ===" >> "$log"
    echo "Stability tests did not pass. See $log for full errors/warnings." >&2
    echo "Full log written to: $log" >&2
    exit 1
  fi
  echo "" >> "$log"
  echo "=== ALL TESTS PASSED ===" >> "$log"
  echo "Stability tests passed successfully. Full log at $log"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  
  # Install binary
  install -Dm755 target/release/mimick "$pkgdir/usr/bin/mimick"
  
  # Install desktop file
  install -Dm644 setup/dev.nicx.mimick.desktop "$pkgdir/usr/share/applications/dev.nicx.mimick.desktop"
  
  # Install icon
  install -Dm644 src/assets/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev.nicx.mimick.png"
  
  # Install metainfo if exists
  if [ -f "dev.nicx.mimick.metainfo.xml" ]; then
    install -Dm644 dev.nicx.mimick.metainfo.xml "$pkgdir/usr/share/metainfo/dev.nicx.mimick.metainfo.xml"
  elif [ -f "data/dev.nicx.mimick.metainfo.xml" ]; then
    install -Dm644 data/dev.nicx.mimick.metainfo.xml "$pkgdir/usr/share/metainfo/dev.nicx.mimick.metainfo.xml"
  fi
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
