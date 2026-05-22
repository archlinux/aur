# Maintainer: Mohammadreza Khani
# Build from repository root: cd packaging/arch && makepkg -si

pkgname=dicto
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal native dictionary app for MDX/MDD files"
arch=('x86_64' 'aarch64')
url="https://github.com/mohamadkhani/dicto"
license=('AGPL-3.0-or-later')
depends=(
  'gtk3'
  'alsa-lib'
  'libxkbcommon'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
  'rust'
  'clang'
  'pkgconf'
)
optdepends=(
  'vulkan-driver: GPU rendering'
)
options=(!lto)

_repo_root="$(cd "${startdir}/../.." && pwd)"
source=("git+file://${_repo_root}")
b2sums=('SKIP')

build() {
  cd "$srcdir/mdict-rs"

  export CARGO_TARGET_DIR="$srcdir/mdict-rs/target"
  cargo build --release --package dicto
}

package() {
  cd "$srcdir/mdict-rs"

  install -Dm755 "$srcdir/mdict-rs/target/release/dicto" \
    "$pkgdir/usr/bin/dicto"

  install -Dm644 "$startdir/dicto.desktop" \
    "$pkgdir/usr/share/applications/dicto.desktop"

  install -Dm644 assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dicto.svg"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
