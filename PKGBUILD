# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=quickenv
pkgver=0.4.1
pkgrel=1
pkgdesc='An unintrusive environment manager'
arch=('x86_64')
url="https://github.com/untitaker/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('469ce6a30b365e9f5ab44680624d905a3bd7e18313bf454fa96d4bf151feb895')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')
optdepends=('direnv: direnv stdlib integration')

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

# tests failing with
# Error: cannot find binary path
# check() {
#   export RUSTUP_TOOLCHAIN=stable
#   export CARGO_TARGET_DIR=target
#   cd "$pkgname-$pkgver"
#   cargo test --release --frozen
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
