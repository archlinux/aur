# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=katharsis
pkgver=1.0.0.29
_pkgver=1.0.0-canary.29
pkgrel=1
pkgdesc='CLI tool for generating RSS feeds'
arch=('x86_64')
url="https://github.com/arghena/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('808fb63ef7242fbb357f8601a9304ad3be6be5aaa95068a14aacd7a594d3c087')
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
  install -Dm644 docs/FAQ.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/USE.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
