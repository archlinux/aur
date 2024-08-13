# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dprint-git
pkgver=0.47.2.r5.g523a443f
pkgrel=1
pkgdesc="A pluggable and configurable code formatting platform written in Rust"
arch=('i686' 'x86_64')
url="https://dprint.dev/"
license=('MIT')
depends=('gcc-libs' 'bzip2')
makedepends=('git' 'cargo')
provides=("dprint=$pkgver")
conflicts=('dprint')
source=("git+https://github.com/dprint/dprint.git")
sha256sums=('SKIP')


prepare() {
  cd "dprint"

  if [ ! -f "crates/dprint/Cargo.lock" ]; then
    cargo update \
      --manifest-path "crates/dprint/Cargo.toml"
  fi
  cargo fetch \
    --manifest-path "crates/dprint/Cargo.toml"
}

pkgver() {
  cd "dprint"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "dprint"

  #cargo test \
  #  --frozen
}

package() {
  cd "dprint"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/dprint/crates/dprint"

  install -d "$pkgdir/usr/share/bash-completion/completions" \
             "$pkgdir/usr/share/elvish/lib" \
             "$pkgdir/usr/share/fish/vendor_completions.d" \
             "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/dprint" completions bash > "$pkgdir/usr/share/bash-completion/completions/dprint"
  "$pkgdir/usr/bin/dprint" completions elvish > "$pkgdir/usr/share/elvish/lib/dprint.elv"
  "$pkgdir/usr/bin/dprint" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/dprint.fish"
  "$pkgdir/usr/bin/dprint" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_dprint"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/dprint"
}
