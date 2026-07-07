# Maintainer: Simon Jackson <sizeak at gmail dot com>
pkgname=xm3-ama-bridge
pkgver=0.1.0
pkgrel=1
pkgdesc='Impersonates an Alexa Mobile Accessory gateway so a Sony WH-1000XM3 assistant button triggers local actions on Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/sizeak/xm3-ama-bridge'
license=('MIT')
depends=('sbc' 'pipewire' 'bluez')
makedepends=('cargo' 'clang' 'pkgconf')
# The release profile strips the binary (strip = true), so skip makepkg's
# debug-package split to avoid a broken/empty xm3-ama-bridge-debug package.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sizeak/xm3-ama-bridge/archive/refs/tags/v$pkgver.tar.gz")
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

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 packaging/systemd/xm3-ama-bridge.service \
    "$pkgdir/usr/lib/systemd/user/xm3-ama-bridge.service"
}
