# Maintainer: Dan Johansen <strit at strits dot dk>
# Contributor: Mark Wagie <mark at manjaro dot org>

pkgname=watchmate
_app_id=io.gitlab.azymohliad.WatchMate
pkgver=0.5.2
pkgrel=1
pkgdesc="PineTime smart watch companion app for Linux phone and desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/azymohliad/watchmate"
license=('GPL3')
depends=('bluez' 'libadwaita')
makedepends=('cargo')
checkdepends=('appstream-glib')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b04129867339a143c5cdc9f1d87756952a5dff50aa2166406ceb754077a77b69')

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

check() {
  cd "$pkgname-$pkgver"
  appstream-util validate-relax --nonet "assets/${_app_id}.metainfo.xml"
  desktop-file-validate "assets/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "assets/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "assets/${_app_id}.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "assets/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "assets/icons/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "assets/icons/${_app_id}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
}
