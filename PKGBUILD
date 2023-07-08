# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=emojimart
pkgver=0.1.7
pkgrel=1
pkgdesc="Modern emoji picker popup for desktop"
arch=('x86_64')
url="https://github.com/vemonet/EmojiMart"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
makedepends=('cargo' 'setconf' 'yarn')
optdepends=('xdotool: automatically paste to your currently focused app (X11)'
            'ydotool: automatically paste to your currently focused app (Wayland)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d6febb26a845796c27640563d5c463a88c19d619a5775d3e927ec710d9508a92')

prepare() {
  cd "EmojiMart-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  yarn install

  # Desktop file
  setconf resources/EmojiMart.desktop Exec "$pkgname"
  setconf resources/EmojiMart.desktop Icon "$pkgname"

  cd src-tauri
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # Don't bundle AppImage
  sed -i 's/"targets": "all",/"targets": "deb",/g' tauri.conf.json
}

build() {
  cd "EmojiMart-$pkgver"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  yarn build
  yarn tauri build
}

package() {
  cd "EmojiMart-$pkgver"
  install -Dm755 src-tauri/target/release/emoji-mart "$pkgdir/usr/bin/$pkgname"

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
