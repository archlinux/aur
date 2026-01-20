# Maintainer: graysky <therealgraysky AT proton DOT me>
pkgname=handy
pkgver=0.7.0
pkgrel=1
pkgdesc="Open source and extensible speech-to-text application that works completely offline"
arch=(x86_64 aarch64)
url="https://github.com/cjpais/Handy"
license=(MIT)
depends=(
  alsa-lib
  cairo
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libappindicator-gtk3
  libevdev
  librsvg
  libsoup3
  openssl
  vulkan-icd-loader
  webkit2gtk-4.1
)
makedepends=(
  bun
  cargo
  clang
  cmake
  git
  pkgconf
  shaderc
  vulkan-headers
)
options=(!lto)
optdepends=(
  'wtype: Wayland support'
  'xdotool: X11 support'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  Handy.desktop
)
sha256sums=('787ff1d22d99bbfbde88f481c06cea9c19c29a8136d776a8e496d80c70002d6a'
            'a0b1b93e21d18adcb6d5f58e3c818bd797cae57b865ae0d6769298876e7103dc')

prepare() {
  cd "${pkgname^}-$pkgver/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build() {
  cd "${pkgname^}-$pkgver"

  bun install
  bun run build
  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname^}-$pkgver"

  install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -dm755 "$pkgdir/usr/lib/Handy/"
  cp -ra --no-preserve=ownership src-tauri/target/release/resources "$pkgdir/usr/lib/Handy/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm744 "$srcdir/${pkgname^}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/128x128@2/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
