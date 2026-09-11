# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-acl
pkgver=0.0.1
pkgrel=1
pkgdesc="Rust reimplementation of the acl project"
arch=('i686' 'x86_64')
url="https://github.com/uutils/acl"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/acl/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aa77fcb2d3062f9e97a9b1b05a4eab771858e6a9b76beb5712d2d6aa0e573700')


prepare() {
  cd "acl-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "acl-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "acl-$pkgver"

  cargo install \
    --frozen \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname "$path")
    basename=$(basename "$path")
    mv "$dir/$basename" "$dir/uutils-$basename"
  done

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-acl"
}
