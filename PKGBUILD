# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-sed-git
pkgver=r66.gae78f46
pkgrel=1
pkgdesc="Rust implementation of sed"
arch=('i686' 'x86_64')
url="https://github.com/uutils/sed"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("uutils-sed=$pkgver")
conflicts=('uutils-sed')
source=("git+https://github.com/uutils/sed.git")
sha256sums=('SKIP')


prepare() {
  cd "sed"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "sed"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

check() {
  cd "sed"

  #cargo test \
  #  --frozen
}

package() {
  cd "sed"

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

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-sed"
}
