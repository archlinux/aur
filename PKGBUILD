# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=universal-android-debloater
pkgver=0.4
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices"
arch=('x86_64')
url="https://github.com/0x192/universal-android-debloater"
license=('GPL3')
depends=('android-tools' 'expat' 'freetype2')
makedepends=('cargo-nightly' 'cmake' 'libxkbcommon' 'lld')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'uad_gui.desktop'
        'uad_gui-opengl.desktop')
options=('!lto')
sha256sums=('63d1843eb98206ea9fc55472d7cb2b85c8e70a18ce815107cd255e120155ead3'
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

#check() {
#  cd "$pkgname-$pkgver"
#  export RUSTFLAGS="-C link-arg=-fuse-ld=lld"
#  export RUSTUP_TOOLCHAIN=nightly
#  cargo test --features glow
#  cargo test --features wgpu
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/uad_gui{,-opengl} -t "$pkgdir/usr/bin"
  install -Dm644 $srcdir/uad_gui{,-opengl}.desktop -t "$pkgdir/usr/share/applications"
}
