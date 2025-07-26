# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wasm-tools-git
pkgver=1.235.0.r16.g7aee4a379
pkgrel=1
pkgdesc="CLI for low-level manipulation of WebAssembly modules"
arch=('i686' 'x86_64')
url="https://github.com/bytecodealliance/wasm-tools"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("wasm-tools=$pkgver")
conflicts=('wasm-tools')
source=("git+https://github.com/bytecodealliance/wasm-tools.git")
sha256sums=('SKIP')


prepare() {
  cd "wasm-tools"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "wasm-tools"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "wasm-tools"

  #cargo test \
  #  --frozen
}

package() {
  cd "wasm-tools"

  cargo install \
    --frozen \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/wasm-tools"
}
