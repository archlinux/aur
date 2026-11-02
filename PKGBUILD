# Maintainer: Akrm Al-Hakimi <alhakimiakrmj@gmail.com>
pkgname=nmrs
pkgver=2.0.0
pkgrel=1
pkgdesc="NetworkManager client built on nmrs and gpui"
arch=('x86_64')
url="https://github.com/freedesktop-rs/nmrs-gui"
license=('MIT')
depends=('networkmanager' 'fontconfig' 'freetype2' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b6e3a0ccebfd1dbc0595f2b8306efc8a002f47834d9e24f549687be0bc02c72b')

prepare() {
  cd "nmrs-gui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "nmrs-gui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "nmrs-gui-$pkgver"
  install -Dm755 target/release/nmrs-gui "$pkgdir/usr/bin/nmrs-gui"
  ln -s nmrs-gui "$pkgdir/usr/bin/nmrs"
  install -Dm644 nmrs.desktop "$pkgdir/usr/share/applications/nmrs.desktop"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
