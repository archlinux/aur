# # Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=musicfetch
_app_id="net.fhannenheim.$pkgname"
pkgver=1.5.0
pkgrel=1
pkgdesc="Download and tag music from YouTube"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Frieder_Hannenheim/musicfetch-ng"
license=('GPL-3.0-or-later')
depends=(
  'cosmic-icon-theme'
  'deno'
  'libxkbcommon'
  'openssl'
  'vulkan-icd-loader'
  'wayland'
  'xdg-user-dirs'
  'yt-dlp'
  'yt-dlp-ejs'
)
makedepends=('cargo')
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('f9d712264732340224ab71af94a9a0a54065eea53bd27e59f4e7d81cd7971781')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" --strip-components 1 -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "resources/${_app_id}.metainfo.xml"
  desktop-file-validate "resources/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/${pkgname}_gui" -t "$pkgdir/usr/bin/"
  install -Dm644 "resources/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "resources/icons/hicolor/scalable/apps/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "resources/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
}
