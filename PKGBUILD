# Maintainer: Rafael Escobar <rafael@paemuri.com>

pkgname=torresmo
pkgver=1.0.7
pkgrel=1
pkgdesc='Dead simple and minimal TUI client for the Transmission daemon'
arch=('x86_64' 'aarch64')
url='https://sr.ht/~paemuri/torresmo'
license=('Unlicense')
depends=('glibc' 'libgcc')
makedepends=('cargo')
optdepends=('transmission-cli: the Transmission daemon to connect to')
# The release profile strips the binary, so a debug package would be empty.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('c77ba5cd9218ff8e783646dcc34a6dde94d9e319708da4bcde78f871c6265252')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
