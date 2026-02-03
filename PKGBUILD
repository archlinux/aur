# Maintainer: Haram Choi <altitudinem at google dot com>
pkgname=pipewire-web-remote
pkgver=0.2.1
pkgrel=1
pkgdesc="A remote control web interface for PipeWire audio systems"
arch=('x86_64')
url="https://github.com/oudeis01/pipewire-web-remote"
license=('MIT')
depends=('pipewire' 'wireplumber')
makedepends=('cargo' 'pkgconf' 'clang')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('20bf5c086ac483cf9161be81ef47e1a1abcb1575ba88046710c134455feab94e')
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
check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}
package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "systemd/pipewire-web-remote.service" "$pkgdir/usr/lib/systemd/user/pipewire-web-remote.service"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
