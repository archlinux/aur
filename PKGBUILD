# Maintainer: Your Name <your@email.com>
pkgname=baywatch
pkgver=0.1.1
pkgrel=1
pkgdesc="Lazy-loading reverse proxy daemon that spins up services on demand based on Host header"
arch=('x86_64' 'aarch64')
url="https://github.com/bjesus/baywatch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install=baywatch.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce52f4cf0e4b2686690215c827ef5a4a7138000f1491d8126bc34e85fe01ce4a')

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
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # Binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Systemd user unit
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  # Example config
  install -Dm644 config.example.yaml "$pkgdir/usr/share/doc/$pkgname/config.example.yaml"
}
