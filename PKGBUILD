# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=socktop
pkgver=1.60.1
pkgrel=1
pkgdesc="A remote system monitor with a rich TUI interface"
arch=('x86_64')
url="https://github.com/jasonwitty/socktop"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'mesa')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5ec9a5c2fa83a8e185a7b88640ce793af6b456292d852e69aaacc1fe0da61288')
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
  install -Dm 755 "target/release/${pkgname}_agent" "$pkgdir/usr/bin/${pkgname}_agent"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  # https://github.com/jasonwitty/socktop/issues/10
  # install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
