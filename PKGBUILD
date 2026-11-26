# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wild-git
pkgver=0.11.0.r222.g9e0f1192
pkgrel=1
pkgdesc="A linker with the goal of being very fast for iterative development"
arch=('x86_64')
url="https://github.com/wild-linker/wild"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'libgcc' libzstd.so)
makedepends=('git' 'cargo' 'zstd')
checkdepends=('clang' 'lld' 'rust-musl' 'taplo-cli' 'wabt' 'wasi-libc' 'wasm-tools' 'wasmtime')
provides=("wild=$pkgver")
conflicts=('wild')
options=('!lto')
source=("git+https://github.com/wild-linker/wild.git")
sha256sums=('SKIP')


prepare() {
  cd "wild"

  if [ ! -f "Cargo.lock" ]; then
    cargo generate-lockfile \
      --manifest-path "wild/Cargo.toml"
  fi
  cargo fetch \
    --locked \
    --target host-tuple \
    --manifest-path "wild/Cargo.toml"
}

pkgver() {
  cd "wild"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "wild"

  ZSTD_SYS_USE_PKG_CONFIG=1 \
  cargo build \
    --frozen \
    --release \
    --manifest-path "$srcdir/wild/wild/Cargo.toml"
}

check() {
  cd "wild"

  # https://github.com/wild-linker/wild/blob/main/PACKAGING.md#testing
  ZSTD_SYS_USE_PKG_CONFIG=1 \
  cargo test \
    --frozen \
    --release \
    --manifest-path "$srcdir/wild/wild/Cargo.toml" \
    -- \
    --skip "wasm/wasm32/rust-println/default"
}

package() {
  cd "wild"

  install -Dm755 "target/release/wild" -t "$pkgdir/usr/bin"
  ln -s "wild" "$pkgdir/usr/bin/ld.wild"

  install -dm755 "$pkgdir/usr/lib/wild"
  ln -s "../../bin/wild" "$pkgdir/usr/lib/wild/ld"

  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/wild"
}
