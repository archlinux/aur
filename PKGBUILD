# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-util-linux-git
pkgver=0.0.1.r311.gdd76c2a
pkgrel=1
pkgdesc="Rust reimplementation of the util-linux project"
arch=('i686' 'x86_64')
url="https://github.com/uutils/util-linux"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("uutils-util-linux=$pkgver")
conflicts=('uutils-util-linux')
source=("git+https://github.com/uutils/util-linux.git")
sha256sums=('SKIP')


prepare() {
  cd "util-linux"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "util-linux"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "util-linux"

  #cargo test \
  #  --frozen
}

package() {
  cd "util-linux"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname $path)
    basename=$(basename $path)
    mv "$dir/$basename" "$dir/uutils-$basename"
  done

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-util-linux"
}
