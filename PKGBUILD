# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wasmtime-git
pkgver=0.12.0.r3420.gd54611dac
pkgrel=1
pkgdesc="Standalone JIT-style runtime for WebAssembly"
arch=('i686' 'x86_64')
url="https://wasmtime.dev/"
license=('apache')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('wasmtime')
conflicts=('wasmtime')
source=("git+https://github.com/bytecodealliance/wasmtime.git")
sha256sums=('SKIP')


prepare() {
  cd "wasmtime"

  git submodule update --init
}

pkgver() {
  cd "wasmtime"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/v//'
}

check() {
  cd "wasmtime"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "wasmtime"

  cargo install \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/wasmtime"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/wasmtime"

  rm -f "$pkgdir/usr"/.crates*
}
