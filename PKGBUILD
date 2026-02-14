# Maintainer: bianca <zhaoxiaokee@gmail.com>

pkgname=bili-live-hime
pkgver=0.5.0
pkgrel=1
pkgdesc="bilibili官方直播姬的轻量化替代工具 (Tauri 版)"
arch=('x86_64' 'aarch64')
url="https://github.com/Rsplwe/bili-live-hime"
license=('GPL2')
depends=('webkit2gtk-4.1' 'gtk3' 'libnm' 'libappindicator-gtk3' 'openssl')
makedepends=('nodejs' 'npm' 'rust' 'cargo')

options=('!lto')

_tagname="LiveHime-v$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tagname.tar.gz")
sha256sums=('d96fd219b42910952f30769f944b1cfd8105655eebe8bde6dd4d5b8cb4b8d8b5')

prepare() {
  cd "bili-live-hime-$_tagname"
  export CARGO_HOME="$srcdir/cargo-home"
  npm ci
}

build() {
  cd "bili-live-hime-$_tagname"

  export CARGO_HOME="$srcdir/cargo-home"
  export NODE_ENV=production

  npm run tauri build -- --no-bundle
}

package() {
  cd "bili-live-hime-$_tagname"

  install -Dm755 "src-tauri/target/release/bili-live-hime" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for size in 32 128; do
    install -Dm644 "src-tauri/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Bili Live Hime
Exec=$pkgname
Icon=$pkgname
Type=Application
Categories=Video;AudioVideo;
Comment=$pkgdesc
Terminal=false
EOF
}
