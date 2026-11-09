# Maintainer: Rishabh Jha <jharishabh672003 at gmail dot com>
pkgname=kcd-indicator
pkgver=0.2.0
pkgrel=1
pkgdesc='System tray indicator and window for the kcd KDE Connect daemon'
arch=('x86_64' 'aarch64')
url='https://github.com/Rishabh672003/kcd-indicator'
license=('GPL-3.0-or-later')
depends=('glib2' 'glibc' 'gtk4' 'hicolor-icon-theme' 'kcd' 'libadwaita' 'libgcc' 'pango')
makedepends=('cargo')
optdepends=('zenity: file picker for Send file in the tray menu'
            'libnotify: pairing alerts')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d72e4601a27bb4adcd0fbe1bca4d8cc62fa530d00f74214fe162d28517392714')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/kcd-indicator "$pkgdir/usr/bin/kcd-indicator"
  install -Dm644 kcd-indicator.desktop "$pkgdir/etc/xdg/autostart/kcd-indicator.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
