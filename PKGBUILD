# Maintainer: Luis Llamas <me@lewisflames.xyz>
#
# Local AUR-style PKGBUILD.
# Build with:  makepkg -si
# Or:          paru -S .

pkgname=spendo-git
pkgver=f69ef57
pkgrel=1
pkgdesc='GnuCash financial data importer and explorer'
arch=('x86_64')
url='https://codeberg.org/lewisflames/spendo'
license=('MIT')
conflicts=('spendo')
provides=('spendo')
depends=(
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'librsvg'
)
makedepends=(
  'bun'
  'rust'
  'git'
)
options=('!debug')
source=("$pkgname::git+https://codeberg.org/lewisflames/spendo.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --always | sed 's/^v//; s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  bun install --frozen-lockfile
  bun run generate-icons
}

build() {
  cd "$srcdir/$pkgname"
  # Build frontend (vite) so cargo build can embed it
  bun run build
  CFLAGS="" cargo build --release --features production --manifest-path src-tauri/Cargo.toml
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 src-tauri/target/release/spendo "$pkgdir/usr/bin/spendo"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/spendo.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Spendo
Comment=GnuCash financial data importer and explorer
Exec=spendo
Icon=spendo
Categories=Finance;Office;
Terminal=false
EOF

  for f in src-tauri/icons/*.png; do
    size=$(basename "$f" .png)
    case "$size" in
      32x32|64x64|128x128|256x256)
        install -Dm644 "$f" "$pkgdir/usr/share/icons/hicolor/$size/apps/spendo.png"
        ;;
      128x128@2x)
        install -Dm644 "$f" "$pkgdir/usr/share/icons/hicolor/256x256/apps/spendo.png"
        ;;
    esac
  done
}
