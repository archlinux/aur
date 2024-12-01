# Maintainer: PinkD <443657547@qq.com>

pkgname=corplink-rs
_pkgbase=corplink-rs
pkgver=5.1
pkgrel=1
pkgdesc='Corplink client written in Rust'
arch=('i686' 'x86_64')
url='https://github.com/PinkD/corplink-rs'
license=('GPL-2.0-only')
makedepends=('cargo' 'go' 'clang')
source=(
  "$pkgname.$pkgver.tar.gz"::"https://github.com/PinkD/corplink-rs/archive/$pkgver.tar.gz"
  "wireguard-go"::"git+https://github.com/PinkD/wireguard-go"
)
sha256sums=(
  '14b46c2820e047f1c1bffeda39fe894d92374b28d83356838c4c3f0f5aeac60f'
  'SKIP'
)
backup=(etc/corplink/config.json)

build() {
  # build libwg
  cd "$srcdir/wireguard-go"
  make libwg
  cp libwg.* "$srcdir/$_pkgbase-$pkgver/libwg/"

  # build corplink-rs
  cd "$srcdir/$_pkgbase-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 600 "config/config.json" "$pkgdir/etc/corplink/config.json"
  install -Dm 644 "systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm 644 "systemd/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
}
