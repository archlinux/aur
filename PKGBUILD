# Maintainer: Joseph Quinn <quinn.josephr@protonmail.com>
pkgname=rustky
pkgver=0.1.0
pkgrel=1
pkgdesc='A modern conky-like system monitor for Wayland'
arch=('x86_64')
url='https://github.com/pegasusheavy/rustky'
license=('MIT')
depends=('wayland' 'ttf-dejavu')
makedepends=('cargo' 'wayland-protocols')
optdepends=(
  'python: Python scripting support (build with python-scripting feature)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pegasusheavy/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e7c495a162d540aa2fdb0bb92a83b02ff2176cfa1ba6e4683c749c846cba93ef')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 rustky.service "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
