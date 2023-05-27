# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('universal-android-debloater' 'universal-android-debloater-opengl')
pkgbase=universal-android-debloater
pkgver=0.5.1
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices"
arch=('x86_64')
url="https://github.com/0x192/universal-android-debloater"
license=('GPL3')
depends=('android-tools' 'gcc-libs')
makedepends=('cargo-nightly' 'libxkbcommon' 'lld')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'uad_gui.desktop')
options=('!lto')
sha256sums=('372418918913cd068fe3caabefce4f9a378e9705e86afee6eb112d71518633f1'
            'e55f259fab5e09d6e91412dbfa74859f609615606422b0e3c937cc774eaedbf3')

prepare() {
  cd "$pkgbase-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgbase-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="-C link-arg=-fuse-ld=lld"

  # OpenGL
  cargo build --release --no-default-features --features glow,no-self-update
  mv target/release/uad_gui target/release/uad_gui-opengl

  # Vulkan
  cargo build --release --no-default-features --features wgpu,no-self-update
}

package_universal-android-debloater() {
  cd "$pkgbase-$pkgver"
  install -Dm755 target/release/uad_gui -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/uad_gui.desktop" -t "$pkgdir/usr/share/applications/"
}

package_universal-android-debloater-opengl() {
  pkgdesc+=" (OpenGL renderer)"
  provides=("$pkgbase")
  conflicts=("$pkgbase")

  cd "$pkgbase-$pkgver"
  install -Dm755 target/release/uad_gui-opengl "$pkgdir/usr/bin/uad_gui"
  install -Dm644 "$srcdir/uad_gui.desktop" -t "$pkgdir/usr/share/applications/"
}
