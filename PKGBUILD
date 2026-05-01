# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=prek-git
pkgver=0.3.11.r5.gc4113c88
pkgrel=1
pkgdesc="A framework to run git hooks"
arch=('i686' 'x86_64')
url="https://prek.j178.dev/"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
provides=("prek=$pkgver")
conflicts=('prek')
source=("git+https://github.com/j178/prek.git")
sha256sums=('SKIP')


prepare() {
  cd "prek"

  if [ ! -f "crates/prek/Cargo.lock" ]; then
    cargo update \
      --manifest-path "crates/prek/Cargo.toml"
  fi
  cargo fetch \
    --manifest-path "crates/prek/Cargo.toml"
}

pkgver() {
  cd "prek"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "prek"

  #cargo test \
  #  --locked
}

package() {
  cd "prek"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/prek/crates/prek"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/prek"
}
