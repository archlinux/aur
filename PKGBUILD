# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wild-git
pkgver=0.5.0.r267.g8cb0bcc
pkgrel=1
pkgdesc="A linker with the goal of being very fast for iterative development"
arch=('i686' 'x86_64')
url="https://github.com/davidlattimore/wild"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
checkdepends=('clang' 'lld' 'rust-musl')
provides=("wild=$pkgver")
conflicts=('wild')
options=('!lto')
source=("git+https://github.com/davidlattimore/wild.git")
sha256sums=('SKIP')


prepare() {
  cd "wild"

  if [ ! -f "wild/Cargo.lock" ]; then
    cargo update \
      --manifest-path "wild/Cargo.toml"
  fi
  cargo fetch \
    --manifest-path "wild/Cargo.toml"
}

pkgver() {
  cd "wild"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "wild"

  #cargo test \
  #  --frozen
}

package() {
  cd "wild"

  cargo install \
    --frozen \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/wild/wild"

  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/wild"
}
