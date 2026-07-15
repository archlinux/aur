pkgname=dogma
pkgver=2.2.0
pkgrel=1
pkgdesc="Bridges secrets from vault backends and infrastructure outputs into sops-encrypted files deployed to NixOS machines"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/dogma"
license=('MIT')
depends=('glibc')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=("0fcad25a7c2187b78ba9a6a05b8396242065d1a70028fc2c1cfcfc04c40149fd")

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/dogma"
}
