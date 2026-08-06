# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=emojimart
pkgver=0.3.2
pkgrel=3
pkgdesc="Modern emoji picker popup for desktop"
arch=('x86_64')
url="https://github.com/vemonet/EmojiMart"
license=('MIT')
depends=(
  'gtk3'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'cargo-tauri'
  'npm'
)
optdepends=(
  'xdotool: automatically paste to your currently focused app (X11)'
  'ydotool: automatically paste to your currently focused app (Wayland)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('17ae7b74813b586b352d10a050e7c5c6d5ecae3ca16827eb26d11813657fc231')

prepare() {
  cd "EmojiMart-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  npm ci

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path src-tauri/Cargo.toml --locked --target host-tuple

  # Desktop file
  desktop-file-edit --set-key=Exec --set-value="$pkgname" --set-icon="$pkgname" \
    resources/EmojiMart.desktop
}

build() {
  cd "EmojiMart-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  export RUSTUP_TOOLCHAIN=stable
  cargo tauri build --no-bundle -- --frozen
}

package() {
  cd "EmojiMart-$pkgver"
  install -Dm755 src-tauri/target/release/emoji-mart-app "$pkgdir/usr/bin/$pkgname"

  for i in 32x32 128x128 128x128@2x; do
    install -Dm644 src-tauri/icons/${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done

  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 resources/EmojiMart.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
