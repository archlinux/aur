# Maintainer: Justin Tom <justin@justintom.com>

pkgname=soundcloud-tui
pkgver=0.1.3
pkgrel=2
pkgdesc='A SoundCloud client for the terminal written in Rust'
arch=('x86_64')
url='https://github.com/7ito/soundcloud-tui'
license=('MIT')
options=('!debug' '!lto')
depends=('alsa-lib' 'dbus' 'gcc-libs' 'glibc' 'mpv' 'pipewire' 'systemd-libs')
makedepends=('cargo' 'clang' 'pkgconf')
optdepends=('gnome-keyring: Secret Service provider for credential storage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('336173600f1496b4263e1c8373c67551b4494021a422dad906d40b4af2b0e80f')

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
