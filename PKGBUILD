# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif-git
pkgver=1.6.0.r7.ge9b4542
pkgrel=2
pkgdesc="AVIF image creator in pure Rust"
arch=('i686' 'x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo' 'nasm')
provides=("cavif=$pkgver")
conflicts=('cavif')
source=("git+https://github.com/kornelski/cavif-rs.git")
sha256sums=('SKIP')


prepare() {
  cd "cavif-rs"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "cavif-rs"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-/./g'
}

check() {
  cd "cavif-rs"

  #cargo test \
  #  --frozen
}

package() {
  cd "cavif-rs"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cavif"
}
