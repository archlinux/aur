# Maintainer: Rafael Escobar <rafael@paemuri.com>

pkgname=torresmo
pkgver=1.0.8
pkgrel=1
pkgdesc='Dead-simple and minimal TUI client for the Transmission daemon'
arch=('x86_64' 'aarch64')
url='https://sr.ht/~paemuri/torresmo'
license=('Unlicense')
depends=('glibc' 'libgcc')
makedepends=('cargo')
optdepends=('transmission-cli: the Transmission daemon to connect to')
# The release profile strips the binary, so a debug package would be empty.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('3d6d7cab154384c820ec345e36a401e7d557385aead8e66e0b8f6418537c3400')

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
