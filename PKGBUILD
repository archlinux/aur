# Maintainer: dadav <dadav at protonmail dot com>

pkgname=battery-notify
pkgver=0.1.1
pkgrel=1
pkgdesc='A simple battery notifier for Linux.'
arch=('x86_64')
url='https://github.com/cdown/battery-notify'
license=('MIT')
makedepends=('git' 'cargo')
provides=("battery-notify=$pkgver")
conflicts=("battery-notify-git")
source=("$pkgname::git+$url" "battery-notify.service")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$pkgname"
  cargo build --release --frozen --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "$pkgname"
  cargo test --frozen --all-features
}

package() {
  install -Dm700 -o $USER battery-notify.service -t "$pkgdir/$HOME/.config/systemd/user/"

  cd "$pkgname"
  install -D target/release/battery-notify -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
