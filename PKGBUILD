# Maintainer: Christian Balcom <robot.inventor@gmail.com>
pkgname=tristim
pkgver=0.2.0
pkgrel=1
pkgdesc='Wayland compositor color validation with USB display colorimeters (CLI + GUI)'
arch=('x86_64')
url='https://github.com/computer-whisperer/tristim'
license=('MIT OR Apache-2.0')
# wayland, libxkbcommon, and vulkan-icd-loader are dlopen'd by tristim-gui at
# runtime, so they do not show up in ldd output — they belong in depends anyway.
depends=('glibc' 'gcc-libs' 'systemd-libs' 'libusb'
         'wayland' 'libxkbcommon' 'vulkan-icd-loader')
makedepends=('cargo')
optdepends=('xdg-desktop-portal: file open/save dialogs in tristim-gui'
            'argyllcms: build ICC profiles from exported .ti3 measurements')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('79af7398585af7289fee51ae059feb1f35e08c149ffbd601115fd5f220a4f99b')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # One shared dependency build for both applications — this is why the gui
  # lives in the workspace.
  cargo build --release --locked -p tristim-cli -p tristim-gui
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tristim target/release/tristim-gui \
    -t "$pkgdir/usr/bin/"
  install -Dm644 50-tristim.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 tristim-gui/dev.tristim.gui.desktop \
    -t "$pkgdir/usr/share/applications/"
  install -Dm644 assets/tristim.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.tristim.gui.svg"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE-MIT LICENSE-APACHE \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
