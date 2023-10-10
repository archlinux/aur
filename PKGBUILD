# Maintainer: Dan Johansen <strit at strits dot dk>
# Contributor: Mark Wagie <mark at manjaro dot org>

pkgname=watchmate
pkgver=0.4.6
pkgrel=1
pkgdesc="PineTime smart watch companion app for Linux phone and desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/azymohliad/watchmate"
license=('GPL3')
depends=('bluez' 'libadwaita')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b76dcb7daa7f2cc8c917c5b59522706ea32d0aca94ec9c08c0ef506f62eda937')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  _appid='io.gitlab.azymohliad.WatchMate'

  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "assets/${_appid}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "assets/${_appid}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "assets/icons/${_appid}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "assets/icons/${_appid}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
}
