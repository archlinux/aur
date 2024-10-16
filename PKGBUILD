# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=emojimart
pkgver=0.3.0
pkgrel=1
pkgdesc="Modern emoji picker popup for desktop"
arch=('x86_64')
url="https://github.com/vemonet/EmojiMart"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'npm'
  'yarn'
)
optdepends=(
  'xdotool: automatically paste to your currently focused app (X11)'
  'ydotool: automatically paste to your currently focused app (Wayland)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f4bdaa9e4f46be73a40cdd9312d8146e1cccbdede4f8dbc325631065a35bd4b')

prepare() {
  cd "EmojiMart-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  export RUSTUP_TOOLCHAIN=stable

  yarn install

  # Desktop file
  desktop-file-edit --set-key=Exec --set-value="$pkgname" --set-icon="$pkgname" \
    resources/EmojiMart.desktop

  cd src-tauri
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Don't bundle AppImage
  sed -i 's/"targets": "all",/"targets": "deb",/g' tauri.conf.json
}

build() {
  cd "EmojiMart-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  export RUSTUP_TOOLCHAIN=stable
  yarn build
  yarn tauri build
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
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
