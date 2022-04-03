# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=universal-android-debloater
pkgver=0.5
pkgrel=2
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices"
arch=('x86_64')
url="https://github.com/0x192/universal-android-debloater"
license=('GPL3')
depends=('android-tools' 'gcc-libs')
makedepends=('cargo-nightly' 'libxkbcommon' 'lld')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'uad_gui.desktop'
        'uad_gui-opengl.desktop')
options=('!lto')
changelog='uad-CHANGELOG.md'
sha256sums=('91bb27c08d3ae516660ce2ae50a1be19aeccb266cd18f223f3c02f4f628529c8'
            'e55f259fab5e09d6e91412dbfa74859f609615606422b0e3c937cc774eaedbf3'
            '80227d6e877e25f650d470c0301c93fe28d1ca25d85a3dbf0c050698f84200e5')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTFLAGS="-C link-arg=-fuse-ld=lld"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target

  # OpenGL
  cargo build --release --features glow
  mv target/release/uad_gui target/release/uad_gui-opengl

  # Vulkan
  cargo build --release --features wgpu
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/uad_gui{,-opengl} -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir"/uad_gui{,-opengl}.desktop -t "$pkgdir/usr/share/applications"
}
