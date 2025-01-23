# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=xan
pkgver=0.13.0
pkgrel=1
pkgdesc='The CSV magician'
arch=('x86_64')
url="https://github.com/medialab/$pkgname"
license=('Unlicense' 'MIT')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('7c9282723a0c6fe16274b1878405592c2a19616c1e73d60e1aaf00098b659226')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo test --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
