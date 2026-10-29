# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=parrot-tts
_pkgname="${pkgname%%-*}"
pkgver=26.10.1
pkgrel=1
pkgdesc="A free, offline, private AI text-to-speech desktop app built on Rust 🦜"
url="https://github.com/rishiskhare/parrot"
_tag=85f702e3593d5b9c7bcb753a051297382ebbe4cb
license=("MIT")
arch=("x86_64" "aarch64")
depends=(
  alsa-lib
  cairo
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libsoup3
  openssl
  webkit2gtk-4.1
  gtk-layer-shell
  libpulse
  libsonic
  pcaudiolib
  libappindicator-gtk3
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
)
options=('!lto' '!debug')

optdepends=(
  'wtype: Wayland support'
  'xdotool: X11 support'
)

source=(
  "$pkgname-$pkgver::git+$url.git#tag=$_tag"
)

conflicts=("$pkgname-bin")
sha256sums=('2af2f3742456a588cbe0fe32d1a88775814ebd34038f8f680c54b824e7dfce2b')

build() {
  cd "$pkgname-$pkgver"

  bun install

  # We generate a oneshot key to package the deb.
  # We don't use the deb file, only the packaged files
  # So the key is not important
  password=$(pwgen -sc 16 1)
  bun run tauri signer generate -w "${pkgname}.key" -p "$password" > /dev/null
  export TAURI_SIGNING_PRIVATE_KEY="$(pwd)/${pkgname}.key"
  export TAURI_SIGNING_PRIVATE_KEY_PASSWORD="$password"

  # Build and bundle deb package
  bun run tauri build --bundles deb
}

package() {
  cd "$pkgname-$pkgver"

  cp -a src-tauri/target/release/bundle/deb/"${_pkgname^}_${pkgver}"_*/data/* "${pkgdir}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  sed -i 's/Categories=/Categories=Utility;/g' "$pkgdir/usr/share/applications/${_pkgname^}.desktop"
  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
