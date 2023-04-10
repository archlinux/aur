# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wasmtime-git
pkgver=7.0.0.r173.g2d1dbb17a
pkgrel=1
pkgdesc="Standalone JIT-style runtime for WebAssembly"
arch=('i686' 'x86_64')
url="https://wasmtime.dev/"
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("wasmtime=$pkgver")
conflicts=('wasmtime')
source=("git+https://github.com/bytecodealliance/wasmtime.git")
sha256sums=('SKIP')


prepare() {
  cd "wasmtime"

  git submodule update --init --recursive

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "wasmtime"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "wasmtime"

  #cargo test \
  #  --frozen
}

package() {
  cd "wasmtime"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/wasmtime"
}
