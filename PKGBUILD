# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=parrot-tts
_pkgname="${pkgname%%-*}"
pkgver=26.2.4
pkgrel=1
pkgdesc="A free, offline, private AI text-to-speech desktop app built on Rust 🦜"
url="https://github.com/rishiskhare/parrot"
_tag=629f2d3ae1edb7503989b532e169d448cd185dd8
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
options=('!lto')

optdepends=(
  'wtype: Wayland support'
  'xdotool: X11 support'
)

source=(
  "$pkgname-$pkgver::git+$url.git#tag=$_tag"
  8ce31099def80f90c02f9f96a7073fd24bcdcd8a.patch
)

conflicts=("$pkgname-bin")
sha256sums=('97f60cf359997fc45c4d6f305e9ad792c4f2c799bfaf6597c60a5dd61d8b04b3'
            'f24e22ec2facb2f155307cdab57c1b44456de2f555a8cd69e716fecb14ae06b3')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < ../8ce31099def80f90c02f9f96a7073fd24bcdcd8a.patch
}

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
