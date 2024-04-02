# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
pkgname=license-generator
pkgver=1.0.0
pkgrel=1
pkgdesc="A command line tool that generates LICENSE file"
arch=("x86_64")
url="https://github.com/azu/license-generator"
license=('MIT')
makedepends=('rust')
provides=('license-generator')
conflicts=('license-generator')
source=("https://github.com/azu/license-generator/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=("3665dd609bf303359c612db5aa81d98469f7e78f46a788c490178e78ac5c72e8")

prepare() {
  cd "$pkgname-$pkgver"
  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

build() {
  cd "$pkgname-$pkgver"

  cargo build -r
}

check() {
  cd "$pkgname-$pkgver"
  cargo test -r
}

package() {
  cd "$pkgname-$pkgver"
  
  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/license-generator"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/license-generator"
}
