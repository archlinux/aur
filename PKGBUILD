# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=gengo
pkgver=0.12.2
pkgrel=1
pkgdesc='Linguist-inspired language classifier'
arch=('x86_64')
url="https://github.com/spenserblack/$pkgname"
license=('MIT' 'Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6707e79672bffa2754f4e952c4c490ee2a3f3002bc6b2c76f2aa90eae3111db6')
makedepends=('cargo' 'cmake' 'zlib')
depends=('gcc-libs' 'glibc')
options=('!lto')

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

# tests failing with:
# Error {
#   kind: NoRepository,
#   source: Some(NoGitRepository {
#     path: "/build/gengo/src/gengo-0.12.1/gengo"
#   })
# }
#check() {
#  export RUSTUP_TOOLCHAIN=stable
#  export CARGO_TARGET_DIR=target
#  cd "$pkgname-$pkgver"
#  cargo test
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
