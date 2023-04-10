# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=typos-git
pkgver=1.14.5.r0.g66d82e5
pkgrel=2
pkgdesc="Source code spell checker"
arch=('i686' 'x86_64')
url="https://github.com/crate-ci/typos"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("typos=$pkgver")
conflicts=('typos')
source=("git+https://github.com/crate-ci/typos.git")
sha256sums=('SKIP')


prepare() {
  cd "typos"

  if [ ! -f "crates/typos-cli/Cargo.lock" ]; then
    cargo update \
      --manifest-path "crates/typos-cli/Cargo.toml"
  fi
  cargo fetch \
    --manifest-path "crates/typos-cli/Cargo.toml"
}

pkgver() {
  cd "typos"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "typos"

  #cargo test \
  #  --frozen
}

package() {
  cd "typos"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/typos/crates/typos-cli"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/typos"
}
