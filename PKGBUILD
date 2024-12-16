# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=envfetch
pkgver=1.1.0
pkgrel=1
pkgdesc='Lightweight CLI tool for working with environment variables'
arch=('x86_64')
url="https://github.com/ankddev/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3b646332b45a0b62dcee0bac0daa53a3c912fc1446c954dade515fc5a744136d')
makedepends=('cargo')
depends=('gcc-libs')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

# tests failing: delete_command_global, load_command_global, set_command_global
# https://github.com/ankddev/envfetch/issues/2
# check() {
#   export CARGO_TARGET_DIR=target
#   cd "$pkgname-$pkgver"
#   cargo test --frozen --release --all-features
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
