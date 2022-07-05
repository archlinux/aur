# Maintainer: Jakub Jirutka <jakub@jirutka.cz>

pkgname=connman-resolvconf
pkgver=0.2.0
pkgrel=1
pkgdesc="ConnMan integration with resolvconf(8)"
arch=('x86_64')
url="https://github.com/jirutka/connman-resolvconf"
license=('MIT')
depends=('connman' 'dbus' 'gcc-libs' 'openresolv')
makedepends=('cargo')
source=("https://github.com/jirutka/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('66addbf52084ca2c46a13e57d10d9acd2a10e39e166bc910d8910cc44ddaf734aff2f8cbf393eb7e4e26c9733364ced1199384b69a69b79e3491e72f4f327ccc')

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
