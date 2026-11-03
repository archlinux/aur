# Maintainer: Rafael Zichia <rafael@paemuri.com>

pkgname=torresmo
pkgver=2.0.0
pkgrel=1
pkgdesc='Dead-simple and minimal TUI client for the Transmission daemon'
arch=('x86_64' 'aarch64')
url='https://sr.ht/~paemuri/torresmo'
license=('AGPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo')
optdepends=('transmission-cli: the Transmission daemon to connect to')
# The release profile strips the binary, so a debug package would be empty.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('ab2412088aa30263b83054c5ce50e26b3f5f78f7a1c0c4d4a6657acc8dc9677c')

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
  install -Dm0644 LICENSES/AGPL-3.0-or-later.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
