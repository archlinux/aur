# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hck-git
pkgver=0.9.1.r2.g4f0cdd9
pkgrel=1
pkgdesc="A close to drop in replacement for cut(1) that can use a regex delimiter instead of a fixed string"
arch=('i686' 'x86_64')
url="https://github.com/sstadick/hck"
license=('MIT' 'custom:Unlicense')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("hck=$pkgver")
conflicts=('hck')
source=("git+https://github.com/sstadick/hck.git")
sha256sums=('SKIP')


prepare() {
  cd "hck"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "hck"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "hck"

  #cargo test \
  #  --frozen
}

package() {
  cd "hck"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/hck"
}
