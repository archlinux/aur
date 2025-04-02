# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-diffutils-git
pkgver=0.4.2.r53.g9bc5348
pkgrel=2
pkgdesc="Rust implementation of diffutils"
arch=('i686' 'x86_64')
url="https://github.com/uutils/diffutils"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("uutils-diffutils=$pkgver")
conflicts=('uutils-diffutils')
source=("git+https://github.com/uutils/diffutils.git")
sha256sums=('SKIP')


prepare() {
  cd "diffutils"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "diffutils"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "diffutils"

  #cargo test \
  #  --frozen
}

package() {
  cd "diffutils"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  # cannot use custom "uu" prefix
  #for path in "$pkgdir/usr/bin"/*; do
  #  dir=$(dirname $path)
  #  basename=$(basename $path)
  #  mv "$dir/$basename" "$dir/uu-$basename"
  #done

  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/uutils-diffutils"
}
