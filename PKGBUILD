# Maintainer: Nick <nickcardosoo123 at gmail dot com>

pkgname=mimick
pkgver=9.15.0
pkgrel=1
pkgdesc='Unofficial Immich desktop client that backs up and browses your photos'
arch=('x86_64' 'aarch64')
url='https://mimick.nicx.dev'
license=('GPL-3.0-or-later')
depends=(
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'gst-plugin-gtk4'
  'gst-plugins-bad-libs'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'libgcc'
  'libheif'
  'libshumate'
  'libstdc++'
  'openssl'
  'pango'
)
makedepends=('cargo' 'clang' 'cmake' 'gettext' 'nasm')
optdepends=(
  'gst-plugins-good: play more video formats'
  'gst-libav: play H.264, HEVC, and other common video codecs'
  'xdg-desktop-portal: show your location on the map'
  'geoclue: show your location on the map'
  'gnome-keyring: store the API key in a Secret Service keyring (or another provider)'
)
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nicx17/mimick/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d37aba4c12bfbaecffeb9f907e564f9935c03f91607046a85698f7f121a496a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
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
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  local icons="$pkgdir/usr/share/icons/hicolor"
  install -Dm755 target/release/mimick -t "$pkgdir/usr/bin/"
  scripts/i18n.sh install "$pkgdir/usr/share/locale"
  scripts/i18n.sh merge setup/dev.nicx.mimick.desktop "$pkgdir/usr/share/applications/dev.nicx.mimick.desktop"
  scripts/i18n.sh merge setup/metainfo/dev.nicx.mimick.metainfo.xml "$pkgdir/usr/share/metainfo/dev.nicx.mimick.metainfo.xml"
  install -Dm644 src/assets/icon.svg "$icons/scalable/apps/dev.nicx.mimick.svg"
  install -Dm644 src/assets/256x256/apps/dev.nicx.mimick.png -t "$icons/256x256/apps/"
  install -Dm644 src/assets/512x512/apps/dev.nicx.mimick.png -t "$icons/512x512/apps/"
  install -Dm644 src/assets/symbolic/apps/dev.nicx.mimick-symbolic.svg -t "$icons/symbolic/apps/"
}
