# Maintainer: PinkD <443657547@qq.com>

pkgname=corplink-rs
_pkgbase=corplink-rs
pkgver=3.6
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
  'd7a649799ff8e6903cc37d4019dd0345e822087d6f20fd762b5f9967944526c3'
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
