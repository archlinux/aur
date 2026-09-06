# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_pkgname=gritql
pkgname=gritql-git
pkgver=0.5.1.r379.4ca28348
pkgrel=1
pkgdesc="GritQL query language for searching, linting, and modifying source code (builds the 'grit' CLI)"
arch=('x86_64' 'aarch64')
url="https://github.com/biomejs/gritql"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('git' 'cargo')
provides=("$_pkgname")
# The upstream binary is /usr/bin/grit, which collides with the unrelated
# 'grit' AUR package (Game Raster Image Transmogrifier).
conflicts=("$_pkgname" 'grit')
# !debug: avoid the huge -C debuginfo=2 build for this large workspace.
# !lto: the tree-sitter grammars and vendored openssl compile C objects that can
# fail to link under makepkg's default -flto.
options=('!debug' '!lto')
source=("$_pkgname::git+https://github.com/biomejs/gritql.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver
  ver=$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)
  printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Tree-sitter grammars and vendored crates live in git submodules.
  git submodule update --init --recursive
  # Arch uses the system rust toolchain, not rustup; drop the upstream pin.
  rm -f rust-toolchain.toml
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The CLI binary crate is named 'grit' (crates/cli_bin).
  cargo build --release --frozen -p grit
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/grit "$pkgdir/usr/bin/grit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
