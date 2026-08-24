# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=handy
pkgver=0.9.6
# git rev-parse "v$pkgver"
_tag=af48dd68a64d58aad128fdbb920492a03da53c79
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
  libappindicator-gtk3
  gtk-layer-shell
  openblas
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
  spirv-headers
)
options=('!lto')
optdepends=(
  'wtype: Wayland support'
  'xdotool: X11 support'
)

source=(
  "$pkgname-$pkgver::git+$url.git#tag=$_tag"
)
conflicts=("$pkgname-bin")
sha256sums=('e30a8ddde7259314509c0e7a6e0d181d55aa7945a8d5aa8ccad3884bd3f0862f')

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
  export RUSTUP_TOOLCHAIN=stable

  # Build and bundle deb package
  bun tauri build --bundles deb
}

package() {
  cd "$pkgname-$pkgver"

  cp -a "${CARGO_TARGET_DIR:-src-tauri/target}/release/bundle/deb/${pkgname^}_${pkgver}"_*/data/* "${pkgdir}"

  # License
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Add category to desktop file
  sed -i 's/Categories=/Categories=Utility;/g' "$pkgdir/usr/share/applications/${pkgname^}.desktop"

  # Install icons
  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/128x128@2/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
