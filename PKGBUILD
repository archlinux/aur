# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=arti-git
pkgver=1.1.3.r77.g698ea803
pkgrel=1
pkgdesc="An implementation of Tor in Rust"
arch=('i686' 'x86_64')
url="https://gitlab.torproject.org/tpo/core/arti"
license=('apache' 'MIT')
depends=('glibc' 'openssl' 'sqlite' 'xz')
makedepends=('git' 'rust')
provides=("arti=$pkgver")
conflicts=('arti')
source=("git+https://gitlab.torproject.org/tpo/core/arti.git")
sha256sums=('SKIP')


prepare() {
  cd "arti"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "arti"

  _tag=$(git tag -l --sort -v:refname | grep -E '^arti-v[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^arti-v//'
}

check() {
  cd "arti"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "arti"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/arti/crates/arti"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/arti"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/arti"
}
