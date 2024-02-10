# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=universal-android-debloater
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices"
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
license=('GPL-3.0-or-later')
depends=('android-tools' 'gcc-libs')
makedepends=('cargo' 'clang' 'cmake' 'mold')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'uad-ng.desktop'
        'version.patch')
conflicts=('universal-android-debloater-opengl')
replaces=('universal-android-debloater-opengl')
options=('!lto')
sha256sums=('b2f5598ed0aa8b9296b7c23e3cfd1e19ba03a7328c33f19ec80aba2f3f7b99d8'
            '8d5d790fffd35101af340792d081f8f75b61b1579bc8f89acab818f03f1071ea'
            'a98d580b058057b513178c90a71bf858b679e854d358b7376ca603cf25898c65')

prepare() {
  cd "$pkgname-next-generation-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # correct version
  patch -Np1 -i ../version.patch
}

build() {
  cd "$pkgname-next-generation-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --no-default-features --features wgpu,no-self-update
}

package() {
  cd "$pkgname-next-generation-$pkgver"
  install -Dm755 target/release/uad-ng -t "$pkgdir/usr/bin/"
  install -Dm644 resources/assets/logo.png "$pkgdir/usr/share/pixmaps/uad-ng.png"
  install -Dm644 "$srcdir/uad-ng.desktop" -t "$pkgdir/usr/share/applications/"
}
