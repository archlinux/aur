# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-bsdutils-git
pkgver=0.0.1.r194.g3ba11da
pkgrel=1
pkgdesc="Rust reimplementation of the bsdutils project"
arch=('i686' 'x86_64')
url="https://github.com/uutils/bsdutils"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
provides=("uutils-bsdutils=$pkgver")
conflicts=('uutils-bsdutils')
source=("git+https://github.com/uutils/bsdutils.git")
sha256sums=('SKIP')


prepare() {
  cd "bsdutils"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "bsdutils"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "bsdutils"

  #cargo test \
  #  --frozen
}

package() {
  cd "bsdutils"

  cargo install \
    --frozen \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname "$path")
    basename=$(basename "$path")
    mv "$dir/$basename" "$dir/uutils-$basename"
  done

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-bsdutils"
}
