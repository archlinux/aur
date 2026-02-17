# Maintainer: Julien Virey <julien.virey@gmail.com>
pkgname=handy
pkgver=0.7.6
# git rev-parse "v$pkgver"
_tag=58b95c5c956abd6ddb28cc7f06279ca86e2812c4
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
  pwgen
  shaderc
  vulkan-headers
  gtk-layer-shell
)
options=('!lto')
optdepends=(
  'wtype: Wayland support'
  'xdotool: X11 support'
)

source=(
  "$pkgname-$pkgver::git+$url.git#tag=$_tag"
  Handy.desktop
)
conflicts=("$pkgname-bin")
sha256sums=('2f3a3e0f18e6556269f6831811d23c748694374b2041f5a4110f185ee5cadd52'
            'a0b1b93e21d18adcb6d5f58e3c818bd797cae57b865ae0d6769298876e7103dc')

build() {
  cd "$pkgname-$pkgver"

  bun install

  # We generate a oneshot key to package the deb.
  # We don't use the deb file, only the packaged files
  # So the key is not important
  password=$(pwgen -sc 16 1)
  bun tauri signer generate -w "${pkgname}.key" -p "$password" > /dev/null
  export TAURI_SIGNING_PRIVATE_KEY="$(pwd)/${pkgname}.key"
  export TAURI_SIGNING_PRIVATE_KEY_PASSWORD="$password"

  # Build and bundle deb package
  bun tauri build --bundles deb
}

package() {
  cd "$pkgname-$pkgver"

  cp -a src-tauri/target/release/bundle/deb/"${pkgname^}_${pkgver}"_*/data/* "${pkgdir}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  rm "$pkgdir/usr/share/applications/${pkgname^}.desktop"
  install -Dm744 "$srcdir/${pkgname^}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/128x128@2/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
