# Maintainer: Justin Slay <justin.slay@gmail.com>
pkgname=puckctl
pkgver=0.1.2
pkgrel=1
pkgdesc="Gamepad / desktop mode for the Steam Controller Puck"
arch=('x86_64')
url="https://github.com/jslay88/puckctl"
license=('MIT')
depends=('gtk4' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf')
options=('!lto')
install=puckctl.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/jslay88/puckctl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32db39801b7be862f68458f4a13a9123dbbc4b31126b1e2818588896288af6a2')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/puckctl "$pkgdir/usr/bin/puckctl"
  install -Dm755 target/release/puckctl-tray "$pkgdir/usr/bin/puckctl-tray"
  install -Dm644 assets/steam-controller.png \
    "$pkgdir/usr/share/puckctl/steam-controller.png"
  install -Dm644 udev/60-puckctl.rules \
    "$pkgdir/usr/lib/udev/rules.d/60-puckctl.rules"
  sed 's|@BINDIR@|/usr/bin|g' systemd/puckctl.service.in >puckctl.service
  sed 's|@BINDIR@|/usr/bin|g' systemd/puckctl-tray.service.in >puckctl-tray.service
  install -Dm644 puckctl.service "$pkgdir/usr/lib/systemd/user/puckctl.service"
  install -Dm644 puckctl-tray.service \
    "$pkgdir/usr/lib/systemd/user/puckctl-tray.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
