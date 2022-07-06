# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termusic
pkgver=0.6.17
pkgrel=1
pkgdesc="Music Player TUI written in Rust"
arch=('x86_64')
url="https://github.com/tramhao/termusic"
license=('MIT' 'GPL3')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'dbus' 'ueberzug')
optdepends=('yt-dlp: download mp3'
            'ffmpeg: download mp3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b4c493d8760edf44a42174bbc6e8de64cd42b48cfa356494ed577eacec48f6ca4c99b9b956ec6254bed8a3eec8c9d4523c84d21738a1897b7c5ea499424b0cb5')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --features mpris,cover,discord --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE_MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
