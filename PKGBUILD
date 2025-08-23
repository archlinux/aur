# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=katharsis
pkgver=1.0.0.30
_pkgver=1.0.0-canary.30
pkgrel=1
pkgdesc='CLI tool for generating RSS feeds'
arch=('x86_64')
url="https://github.com/arghena/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('6cbf247a7a32e072aebbf12dc53590c3281b6b7e852fae374a2c3c0d06dcab77')
makedepends=('cargo')
#depends=('')

prepare() {
  cd "$pkgname-$_pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$_pkgver"
  cargo build --frozen --release
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$_pkgver"
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
