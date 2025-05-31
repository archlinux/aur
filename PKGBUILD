# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-findutils-git
pkgver=0.8.0.r33.gd55e2f9
pkgrel=1
pkgdesc="Rust implementation of findutils"
arch=('i686' 'x86_64')
url="https://github.com/uutils/findutils"
license=('MIT')
depends=('gcc-libs' 'oniguruma')
makedepends=('git' 'cargo')
provides=("uutils-findutils=$pkgver")
conflicts=('uutils-findutils')
source=("git+https://github.com/uutils/findutils.git")
sha256sums=('SKIP')


prepare() {
  cd "findutils"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "findutils"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "findutils"

  #cargo test \
  #  --frozen
}

package() {
  cd "findutils"

  RUSTONIG_DYNAMIC_LIBONIG=1 \
  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname $path)
    basename=$(basename $path)
    mv "$dir/$basename" "$dir/uu-$basename"
  done

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-findutils"
}
