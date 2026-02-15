# Maintainer: Your Name <your@email.com>
pkgname=baywatch
pkgver=0.1.0
pkgrel=1
pkgdesc="Lazy-loading reverse proxy daemon that spins up services on demand based on Host header"
arch=('x86_64' 'aarch64')
url="https://github.com/bjesus/baywatch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install=baywatch.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('51678d852fbd85db125fec1077a2441c2db2f5b8beed79c7c78fa73ca58a7696')

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
