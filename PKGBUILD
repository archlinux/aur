# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bao-git
pkgver=0.12.1.r6.ge5f01f8
pkgrel=1
pkgdesc="A verified streaming tool"
arch=('i686' 'x86_64')
url="https://github.com/oconnor663/bao"
license=('Apache-2.0' 'CC0-1.0')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("bao=$pkgver")
conflicts=('bao')
source=("git+https://github.com/oconnor663/bao")
sha256sums=('SKIP')


prepare() {
  cd "bao"

  if [ ! -f "bao_bin/Cargo.lock" ]; then
    cargo update \
      --manifest-path "bao_bin/Cargo.toml"
  fi
  cargo fetch \
    --manifest-path "bao_bin/Cargo.toml"
}

pkgver() {
  cd "bao"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

check() {
  cd "bao"

  cargo test \
    --frozen \
    --manifest-path "bao_bin/Cargo.toml"
}

package() {
  cd "bao"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/bao/bao_bin"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/bao"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bao"
}
