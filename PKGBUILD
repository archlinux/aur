# Maintainer: Radek Podgorny <radek@podgorny.cz>
pkgname=unpalm
pkgver=0.1.2
pkgrel=1
pkgdesc="Linux palm rejection filter for touchpads"
arch=('x86_64')
url="https://github.com/rpodgorny/unpalm"
license=('GPL-3.0-only')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

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
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install service file, fixing path for system package location
  sed 's|/usr/local/bin/|/usr/bin/|g' unpalm.service |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
