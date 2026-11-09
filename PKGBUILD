# Maintainer: Lucas Santos <hello@lsantos.dev>
# pkgver and sha256sums are rewritten by .github/workflows/aur.yml on every tag.
pkgname=opensynapse
pkgver=0.1.1
pkgrel=1
pkgdesc="Remap buttons, set DPI and lighting on Razer mice from Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/khaosdoctor/opensynapse"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'libxkbcommon' 'wayland' 'libglvnd')
optdepends=('xdg-desktop-portal: file picker for profile import/export in the GUI')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e446457132185091b81310c6f0d0e7d678cfbbd6c2722ab66d3d67bcdcc477f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features gui
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/opensynapse "$pkgdir/usr/bin/opensynapse"
  install -Dm755 target/release/opensynapse-gui "$pkgdir/usr/bin/opensynapse-gui"
  # gives the logged-in user access to the mouse without sudo
  install -Dm644 udev/70-opensynapse.rules "$pkgdir/usr/lib/udev/rules.d/70-opensynapse.rules"
  install -Dm644 assets/opensynapse.desktop "$pkgdir/usr/share/applications/opensynapse.desktop"
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/opensynapse.svg"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/opensynapse.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 PROTOCOL.md "$pkgdir/usr/share/doc/$pkgname/PROTOCOL.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/protocols" devices/protocols/*.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
