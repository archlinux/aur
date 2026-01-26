# Maintainer: Julien Virey <julien.virey@gmail.com>
pkgname=handy
pkgver=0.7.0
pkgrel=2
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
  libevdev
  libsoup3
  openssl
  vulkan-icd-loader
  webkit2gtk-4.1
)
makedepends=(
  appmenu-gtk-module
  bun
  cargo
  clang
  cmake
  git
  nodejs
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
conflicts=("$pkgname-bin")
sha256sums=('787ff1d22d99bbfbde88f481c06cea9c19c29a8136d776a8e496d80c70002d6a'
            'a0b1b93e21d18adcb6d5f58e3c818bd797cae57b865ae0d6769298876e7103dc')

build() {
  cd "${pkgname^}-$pkgver"

  bun install
  # Use the appimage bundle, but ignore error
  # about building the appimage, we only want the
  # target binary and ressources
  bun tauri build --bundles appimage || true
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
