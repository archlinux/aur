# Maintainer: Oskar Gerlicz-Kowalczuk <oskar@gerlicz.space>

pkgname=andron
pkgver=0.2.0
pkgrel=1
pkgdesc="Ultra-lightweight, stripped-down Android container & translation runtime for Linux"
arch=('x86_64')
url="https://github.com/gerliczkowalczuk/andron"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'wayland: native Wayland zero-copy display support'
  'pipewire: low-latency direct audio routing'
  'waydroid: accelerated system container backend'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gerliczkowalczuk/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8dee4449e27c5e89cc5dc9cac68a501ebe5739a1e2a96ec10c347f6c5c675180')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-targets
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
