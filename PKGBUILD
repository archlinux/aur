# Maintainer: Justin Tom <justin@justintom.com>

pkgname=soundcloud-tui
pkgver=0.1.9
pkgrel=1
pkgdesc='A SoundCloud client for the terminal written in Rust'
arch=('x86_64')
url='https://github.com/7ito/soundcloud-tui'
license=('MIT')
options=('!debug' '!lto')
depends=('alsa-lib' 'dbus' 'gcc-libs' 'glibc' 'mpv' 'pipewire' 'systemd-libs')
makedepends=('cargo' 'clang' 'pkgconf')
optdepends=('gnome-keyring: Secret Service provider for credential storage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('838c010ce1e81ccf474e25be6b19ab3e4914c947808fd5c739df6743dfcf4816')

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
