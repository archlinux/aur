# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=socktop
pkgver=1.40.0
pkgrel=1
pkgdesc="A remote system monitor with a rich TUI interface"
arch=('x86_64')
url="https://github.com/jasonwitty/socktop"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'mesa')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c75c0866fbf649a83b65c91acb46d02814d96393676b94b0b44c6a2e5551176f')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  # https://github.com/jasonwitty/socktop/issues/10
  # install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
