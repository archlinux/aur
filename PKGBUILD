# Maintainer: Christian Balcom <robot.inventor@gmail.com>
pkgname=tristim
pkgver=0.3.0
pkgrel=1
pkgdesc='Wayland compositor color validation with USB display colorimeters (CLI + GUI)'
arch=('x86_64')
url='https://github.com/computer-whisperer/tristim'
# The binaries link tristim-driver (GPL-2.0-or-later, derived from the
# ArgyllCMS instrument drivers); the rest of the workspace is MIT OR Apache-2.0.
license=('GPL-2.0-or-later')
# wayland, libxkbcommon, and vulkan-icd-loader are dlopen'd by tristim-gui at
# runtime, so they do not show up in ldd output — they belong in depends anyway.
depends=('glibc' 'gcc-libs' 'systemd-libs' 'libusb'
         'wayland' 'libxkbcommon' 'vulkan-icd-loader')
makedepends=('cargo')
optdepends=('xdg-desktop-portal: file open/save dialogs in tristim-gui'
            'argyllcms: build ICC profiles from exported .ti3 measurements')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Placeholder until the release tag exists — run `updpkgsums` against the
# published tag before pushing to the AUR.
sha256sums=('73e707cb280296354edd78d9b92d24190babec5b151fab04f3f0c7c5f77d8a06')

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
  install -Dm644 tristim-driver/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPL2"
}
