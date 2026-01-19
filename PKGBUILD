# Maintainer: James Liu <contact@no-bull.sh>

pkgname=reflector-rs-git
pkgver=0.1.r144.g4d67057
pkgrel=1
pkgdesc='Retrieve and filter the latest Arch Linux mirror list (Rust implementation)'
arch=('x86_64')
url='https://github.com/james7132/reflector-rs'
license=('GPL-2.0-or-later')
provides=('reflector')
conflicts=('reflector')
makedepends=('cargo' 'git' 'rust')
backup=('etc/xdg/reflector/reflector.conf')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/reflector-rs"
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//;s/-/./g'
  else
    printf "0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/reflector-rs"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/reflector-rs"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "$srcdir/reflector-rs"

  # Install binary
  install -Dm755 "target/$CARCH-unknown-linux-gnu/release/reflector" \
    "$pkgdir/usr/bin/$pkgname"

  # Install systemd service and timer
  install -Dm644 "dist/reflector.service" \
    "$pkgdir/usr/lib/systemd/system/reflector.service"
  install -Dm644 "dist/reflector.timer" \
    "$pkgdir/usr/lib/systemd/system/reflector.timer"

  # Install default configuration
  install -Dm644 "dist/reflector.conf" \
    "$pkgdir/etc/xdg/reflector/reflector.conf"

  # Install man page
  install -Dm644 "man/reflector.1" "usr/share/man/man1/reflector.1"

  # Install license
  install -Dm644 LICENSE "usr/share/licenses/$pkgname/LICENSE"
}
