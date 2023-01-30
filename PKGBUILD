# Maintainer: PinkD <443657547@qq.com>

pkgname=corplink-rs
_pkgbase=corplink-rs
pkgver=3.4
pkgrel=1
pkgdesc='Corplink client written in Rust'
arch=('i686' 'x86_64')
url='https://github.com/PinkD/corplink-rs'
license=('GPL2')
makedepends=('cargo' 'go')
source=(
  "$pkgname.$pkgver.tar.gz"::"https://github.com/PinkD/corplink-rs/archive/$pkgver.tar.gz"
  "wireguard-go"::"git+https://github.com/PinkD/wireguard-go"
)
sha256sums=(
  '09ce96c1f3f2b416ee6d9aff6430bbc31f889ec5f61d497402f8f04b990b363a'
  'SKIP'
)
backup=(etc/corplink/config.json)

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  cargo build --release
  cd "$srcdir/wireguard-go"
  make
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 600 "config/config.json" "$pkgdir/etc/corplink/config.json"
  install -Dm 644 "systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm 644 "systemd/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
  cd "$srcdir/wireguard-go"
  install -Dm 755 "wireguard-go" "$pkgdir/usr/bin/wg-corplink"
}
