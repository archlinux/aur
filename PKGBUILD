# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dijo-1995parham
pkgver=1.8.0
pkgrel=1
pkgdesc="Scriptable, curses-based, digital habit tracker"
arch=('x86_64')
url="https://github.com/1995parham/dijo"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('35e5a9c05b617230f1a456b0fb12be7a627cdd6e1a757eb40bf50e9f5f37dd5f')

prepare() {
  cd dijo-$pkgver
  # the tag does not carry the release version, so set it on the man page
  sed -i "s/^\.TH .*/.TH DIJO 1 \"$(date -u -d "@${SOURCE_DATE_EPOCH}" +'%B %d, %Y')\" dijo-$pkgver/" dijo.1
}

build() {
  cd dijo-$pkgver
  export DIJO_VERSION="$pkgver"
  cargo build --release --locked
}

package() {
  cd dijo-$pkgver
  install -Dm755 target/release/dijo -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/dijo"
  install -Dm644 "dijo.1" "$pkgdir/usr/share/man/man1/dijo.1"
}
