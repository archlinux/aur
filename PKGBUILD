# Maintainer: lemonxah <lemonxah@gmail.com>
pkgname=zestbay
pkgver=0.8.2
pkgrel=1
pkgdesc="A PipeWire patchbay and audio routing manager with LV2/CLAP/VST3 plugin hosting"
arch=('x86_64')
url="https://github.com/lemonxah/zestbay"
license=('MIT')
options=('!lto' '!debug')
depends=(
  'pipewire'
  'qt6-base'
  'qt6-declarative'
  'lilv'
  'lv2'
  'libx11'
  'dbus'
  'suil'
)
makedepends=(
  'rust'
  'cargo'
  'clang'
  'cmake'
  'pkg-config'
  'qt6-base'
  'qt6-declarative'
  'pipewire'
  'lilv'
  'lv2'
  'libx11'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
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
  cargo build --workspace --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "target/release/zestbay-ui-bridge" "$pkgdir/usr/lib/$pkgname/zestbay-ui-bridge"
  install -Dm644 "zestbay.desktop" "$pkgdir/usr/share/applications/zestbay.desktop"
  install -Dm644 "images/zesticon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/zestbay.png"
  install -Dm644 "images/zesttray.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/zestbay-tray.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
