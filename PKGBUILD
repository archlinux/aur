# Maintainer: Justin Tom <justin@justintom.com>

pkgname=soundcloud-tui
pkgver=0.1.13
pkgrel=1
pkgdesc='A SoundCloud client for the terminal written in Rust'
arch=('x86_64')
url='https://github.com/7ito/soundcloud-tui'
license=('MIT')
options=('!debug' '!lto')
depends=('alsa-lib' 'dbus' 'ffmpeg' 'gcc-libs' 'glibc' 'systemd-libs')
makedepends=('cargo' 'clang' 'pkgconf')
optdepends=('gnome-keyring: Secret Service provider for credential storage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52bd2a930da2d6f100de11e9987ffbeffdb55d0d9ca151b8388536b2fc609b44')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
