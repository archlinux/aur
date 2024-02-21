# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=numbat-git
pkgver=1.10.1.r12.g1fbf8a0
pkgrel=1
pkgdesc="A statically typed programming language for scientific computations with first class support for physical dimensions and units"
arch=('i686' 'x86_64')
url="https://numbat.dev/"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("numbat=$pkgver")
conflicts=('numbat')
source=("git+https://github.com/sharkdp/numbat.git")
sha256sums=('SKIP')


prepare() {
  cd "numbat"

  if [ ! -f "numbat-cli/Cargo.lock" ]; then
    cargo update \
      --manifest-path "numbat-cli/Cargo.toml"
  fi
  cargo fetch \
    --manifest-path "numbat-cli/Cargo.toml"
}

pkgver() {
  cd "numbat"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "numbat"

  #cargo test \
  #  --frozen
}

package() {
  cd "numbat"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/numbat/numbat-cli"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/numbat"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/numbat"

  install -Dm644 "assets/numbat.desktop" -t "$pkgdir/usr/share/applications"

  install -Dm644 "assets/numbat.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  for icon in assets/numbat-*x*.png; do
    filename_without_prefix=${icon#*-}
    icon_size=${filename_without_prefix%.*}
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$icon_size/apps/numbat.png"
  done
}
