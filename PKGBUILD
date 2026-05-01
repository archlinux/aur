# Maintainer: Gerhard Schwanzer <geri@sdf.org>
pkgname=pw-duck
pkgver=0.2.4
pkgrel=1
pkgdesc="Linux tray app that ducks non-voice audio while remote voice is active"
arch=('x86_64')
url="https://github.com/geri1701/pw-duck"
license=('MIT')
depends=(
  'coreutils'
  'gtk4'
  'hicolor-icon-theme'
  'libpulse'
  'pipewire'
  'pipewire-pulse'
)
makedepends=(
  'cargo'
  'clang'
  'desktop-file-utils'
  'pkgconf'
)
optdepends=(
  'wireplumber: recommended PipeWire session manager'
  'gnome-shell-extension-appindicator: tray support on GNOME Shell'
)
conflicts=('pw-duck-git')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d1fb11f642618cf5c2d7809ecfeb8acee877f89af09f11687689cd1b15043c1')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --features gui
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --locked --features gui
  desktop-file-validate assets/applications/pw-duck.desktop
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/pw-duck "$pkgdir/usr/bin/pw-duck"
  install -Dm644 assets/applications/pw-duck.desktop \
    "$pkgdir/usr/share/applications/pw-duck.desktop"

  mkdir -p "$pkgdir/usr/share/icons"
  cp -r assets/icons/hicolor "$pkgdir/usr/share/icons/hicolor"

  install -Dm644 README.md "$pkgdir/usr/share/doc/pw-duck/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pw-duck/LICENSE"
}
