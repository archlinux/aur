# Maintainer: Rafael Escobar <rafael@paemuri.com>

pkgname=torresmo
pkgver=1.0.3
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
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~paemuri/torresmo/archive/v$pkgver.tar.gz")
sha256sums=('740d677a1eb0677f9c71033305b7e43b1725fe9ba08fdce44d6fc83287c7d73d')

prepare() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
