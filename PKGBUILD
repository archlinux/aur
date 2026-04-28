# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub
pkgver=0.9.0
pkgrel=1

pkgdesc='A subscriptions only TUI Youtube client'
url='https://github.com/sarowish/ytsub'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('sqlite')
optdepends=('mpv: for playing videos', 'yt-dlp: for playing videos')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e13dfa6d9c5629cf5f534e1be03396272b8bcce41d65b03561083efc9af6d77f')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
