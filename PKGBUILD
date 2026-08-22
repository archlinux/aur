# Maintainer: Umut Dincer Yananer <umutdncr@gmail.com>
#
# Reference copy — the canonical PKGBUILD lives in the AUR repository
# (https://aur.archlinux.org/packages/nightlightd); keep the two in step.
pkgname=nightlightd
pkgver=0.3.1
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
sha256sums=('8fed22a2182b7d488dc06f3f0d54a072d0b27349957785d84c4a475a4ff4ac65')

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
  # The panel's applications-menu entry (#50). The tray's entry above is
  # autostart and never appears in a menu, so without this the settings
  # window can only be reached from the tray or by typing its name.
  install -Dm644 dist/nightlight-panel.desktop "$pkgdir/usr/share/applications/nightlight-panel.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
