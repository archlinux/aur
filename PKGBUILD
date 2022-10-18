# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub
pkgver=0.3.1
pkgrel=1

pkgdesc='A subscriptions only TUI Youtube client that uses the Invidious API'
url='https://github.com/sarowish/ytsub'
arch=('x86_64')
license=('GPL3')
depends=('sqlite')
optdepends=('mpv: for playing videos', 'yt-dlp: for playing videos')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('186521d7264c19ee5ec5075aa9ddc5adc12f34b6438869818ffd956c51794bd2')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
