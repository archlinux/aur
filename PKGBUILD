# Maintainer: Jakub Jirutka <jakub@jirutka.cz>

pkgname=connman-resolvconf
pkgver=0.1.0
pkgrel=1
pkgdesc="ConnMan integration with resolvconf(8)"
arch=('x86_64')
url="https://github.com/jirutka/connman-resolvconf"
license=('MIT')
depends=('connman' 'dbus' 'gcc-libs' 'openresolv')
makedepends=('cargo')
source=("https://github.com/jirutka/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a07ea50e0e1d0c12c60b59dfcbdedabdaacc6d336ea72bbe608558ad79d687f641e4fa08e9efd74e1761b07b938fd202214b0c0770f8bfffda4f3daae7e93765')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --offline
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir"/usr/sbin target/release/connman-resolvconfd
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system contrib/systemd/connman-resolvconf.service
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
