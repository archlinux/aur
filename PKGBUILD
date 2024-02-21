# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaare Jenssen <kaare at jenssen dot it>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname=fd-git
pkgver=9.0.0.r41.g969316c
pkgrel=1
pkgdesc="A simple, fast and user-friendly alternative to 'find'"
arch=('i686' 'x86_64')
url="https://github.com/sharkdp/fd"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("fd=$pkgver")
conflicts=('fd')
source=("git+https://github.com/sharkdp/fd.git")
sha256sums=('SKIP')


prepare() {
  cd "fd"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "fd"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "fd"

  #cargo test \
  #  --frozen
}

package() {
  cd "fd"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  make completions
  install -Dm644 "autocomplete/fd.bash" "$pkgdir/usr/share/bash-completion/completions/fd"
  install -Dm644 "autocomplete/fd.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 "autocomplete/_fd" -t "$pkgdir/usr/share/zsh/site-functions"

  install -Dm644 "doc/fd.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/fd"
}
