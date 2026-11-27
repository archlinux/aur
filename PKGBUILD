# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dijo-1995parham
pkgver=1.9.0
pkgrel=1
pkgdesc="Scriptable, curses-based, digital habit tracker"
arch=('x86_64')
url="https://github.com/1995parham/dijo"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('97f472be3f94f3c30e4256c06170accc3d872248bc62cfbc89095a23347420fc')

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
