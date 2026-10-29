# Maintainer: Elmar Athmer <elmar+aur at athmer dot org>
pkgname=age-plugin-openpgp-card
pkgver=0.1.2
pkgrel=1
pkgdesc='Age plugin for using ed25519 on OpenPGP Card devices (YubiKeys, Nitrokeys)'
arch=('x86_64' 'aarch64')
url='https://github.com/wiktor-k/age-plugin-openpgp-card'
license=('Apache-2.0 OR MIT')
depends=('glibc' 'libgcc' 'pcsclite')
makedepends=('cargo')
optdepends=('ccid: generic USB smart card reader driver'
            'age: age encryption tool'
            'rage: Rust implementation of age')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad96bf09753be937f81f58a17450bd3b50e115a511ce8d1e7eefb4557c9a54c8')

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
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE-APACHE LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
