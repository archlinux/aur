# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rsign2-git
pkgver=0.6.7.r0.ga9fe332
pkgrel=1
pkgdesc="A command-line tool to sign files and verify signatures in pure Rust"
arch=('i686' 'x86_64')
url="https://github.com/jedisct1/rsign2"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
provides=("rsign2=$pkgver")
conflicts=('rsign2')
source=("git+https://github.com/jedisct1/rsign2.git")
sha256sums=('SKIP')


prepare() {
  cd "rsign2"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "rsign2"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "rsign2"

  #cargo test \
  #  --frozen
}

package() {
  cd "rsign2"

  cargo install \
    --frozen \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rsign2"
}
