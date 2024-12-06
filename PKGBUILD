# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-procps-git
pkgver=0.0.1.r627.g575a5cd
pkgrel=1
pkgdesc="Rust reimplementation of the procps project"
arch=('i686' 'x86_64')
url="https://github.com/uutils/procps"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("uutils-procps=$pkgver")
conflicts=('uutils-procps')
source=("git+https://github.com/uutils/procps.git")
sha256sums=('SKIP')


prepare() {
  cd "procps"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "procps"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "procps"

  #cargo test \
  #  --frozen
}

package() {
  cd "procps"

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

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-procps"
}
