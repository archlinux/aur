# Maintainer: Seann Moser <seannmoser@gmail.com>

pkgname=pfs-rs-git
_pkgname=pfs-rs
pkgver=0.2.5.r78.g800affa
pkgrel=1
pkgdesc='Artemis .pfs file unpacker and packer written in Rust'
arch=('x86_64')
url='https://github.com/sakarie9/pfs-rs'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('pfs-rs')
conflicts=('pfs-rs')
source=('git+https://github.com/sakarie9/pfs-rs.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local ver
  ver="$(cargo metadata --no-deps --format-version=1 \
    | jq -r '.packages[] | select(.name == "pfs-rs") | .version' 2>/dev/null || true)"

  if [[ -z "$ver" || "$ver" == "null" ]]; then
    ver="$(grep -m1 '^version' pfs-rs/Cargo.toml | sed -E 's/version *= *"([^"]+)"/\1/')"
  fi

  printf "%s.r%s.g%s" \
    "$ver" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --package pfs-rs
}

check() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo test --frozen --workspace
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/pfs-rs" "$pkgdir/usr/bin/pfs-rs"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
