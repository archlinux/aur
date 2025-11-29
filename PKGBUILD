# Maintainer: vicrodh <vicrodh[at]gmail[dot]com>
pkgname=majusb
pkgver=0.2.0.alpha
pkgrel=4
_tag=0.2.0-alpha
pkgdesc="A graphical tool to create bootable USB drives from Linux or Windows ISOs"
arch=('x86_64')
url="https://github.com/vicrodh/usb-bootable-creator"
license=('MIT')
depends=(
  'gtk4'
  'glib2'
  'polkit'
  'coreutils'
  'util-linux'
  'dosfstools'
  'ntfs-3g'
  'parted'
  'rsync'
  'wimlib'
  'gptfdisk'
)
makedepends=('rust' 'cargo' 'pkgconf')
source=("$pkgname-$_tag.tar.gz::$url/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/usb-bootable-creator-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/usb-bootable-creator-$_tag"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/usb-bootable-creator-$_tag"

  # Install binaries
  install -Dm755 target/release/rust-usb-bootable-creator "$pkgdir/usr/bin/rust-usb-bootable-creator"
  install -Dm755 target/release/cli_helper "$pkgdir/usr/bin/cli_helper"

  # Install icons in various sizes
  install -Dm644 assets/icons/icon-128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/majusb-bootable-creator.png"
  install -Dm644 assets/icons/icon-256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/majusb-bootable-creator.png"
  install -Dm644 assets/icons/icon-512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/majusb-bootable-creator.png"
  install -Dm644 assets/icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/majusb-bootable-creator.svg"

  # Install desktop file
  install -Dm644 assets/majusb-bootable-creator.desktop "$pkgdir/usr/share/applications/majusb-bootable-creator.desktop"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
