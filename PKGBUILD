# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=vinyl-player
_app_id=page.codeberg.M23Snezhok.Vinyl
pkgver=1.6.1
pkgrel=1
pkgdesc="Elegant music player"
arch=('x86_64')
url="https://codeberg.org/M23Snezhok/Vinyl"
license=('GPL-3.0-or-later')
depends=(
  'gst-plugins-base-libs'
  'gst-plugins-bad-libs'
  'gstreamer'
  'gtk4'
  'libadwaita'
)
makedepends=(
  'cargo'
  'git'
)
optdepends=('gst-plugins-bad')
source=("git+https://codeberg.org/M23Snezhok/Vinyl.git#tag=v$pkgver")
sha256sums=('7bd6f7ca7c5d9d01432967f2c84cd6a54b5912d8f93b21f35f3d334f7eaf1590')

prepare() {
  cd Vinyl
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd Vinyl
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd Vinyl
  appstreamcli validate --no-net "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  cd Vinyl
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "data/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "data/${_app_id}.service" -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 "data/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "data/hicolor/scalable/apps/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "data/hicolor/symbolic/apps/${_app_id}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
}
