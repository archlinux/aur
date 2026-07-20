# Maintainer: Umut Dincer Yananer <umutdncr@gmail.com>
#
# Reference copy — the canonical PKGBUILD lives in the AUR repository
# (https://aur.archlinux.org/packages/nightlightd); keep the two in step.
pkgname=nightlightd
pkgver=0.1.0
pkgrel=1
pkgdesc="Zero-config screen colour temperature daemon for X11, with tray, panel and TUI clients"
arch=('x86_64')
url="https://github.com/umutdinceryananer/nightlightd"
license=('GPL-3.0-or-later')
# The daemon itself only needs glibc; the GUI panel dlopens GL, X11 and
# xkbcommon at runtime, so they are runtime deps ldd cannot see.
depends=('gcc-libs' 'glibc' 'libgl' 'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'libxrandr')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5878193b2eccd4df23cdfc412135eb74d40a16715c209daced1c4aeba7e7f2de')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/nightlightd -t "$pkgdir/usr/bin/"
  install -Dm755 target/release/nightlight-tray -t "$pkgdir/usr/bin/"
  install -Dm755 target/release/nightlight-panel -t "$pkgdir/usr/bin/"
  install -Dm755 target/release/nightlight-tui -t "$pkgdir/usr/bin/"
  install -Dm644 dist/nightlightd.service "$pkgdir/usr/lib/systemd/user/nightlightd.service"
  install -Dm644 dist/nightlight-tray.desktop "$pkgdir/etc/xdg/autostart/nightlight-tray.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
