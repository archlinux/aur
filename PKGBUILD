# Maintainer: Ryno Kotze <lemonxah@gmail.com>
pkgname=slimevr-cli
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI tool for sending reset commands to a SlimeVR server"
arch=('x86_64')
url="https://github.com/lemonxah/slimevr-cli"
license=('MIT' 'Apache-2.0')
depends=('alsa-lib')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/lemonxah/slimevr-cli.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  # Install binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install MP3 assets
  install -Dm644 assets/full-reset.mp3 "$pkgdir/usr/share/$pkgname/assets/full-reset.mp3"
  install -Dm644 assets/yaw-reset.mp3 "$pkgdir/usr/share/$pkgname/assets/yaw-reset.mp3"

  # Install licenses
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
