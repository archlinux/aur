# Maintainer: PinkD <443657547@qq.com>

pkgname=corplink-rs
_pkgbase=corplink-rs
pkgver=5.5
pkgrel=1
pkgdesc='Corplink client written in Rust'
arch=('x86_64')
url='https://github.com/PinkD/corplink-rs'
license=('GPL-2.0-only')
makedepends=('cargo' 'go' 'clang')
source=(
  "$pkgname-git"::"git+https://github.com/PinkD/corplink-rs.git#tag=$pkgver"
  "wireguard-go-git"::"git+https://github.com/PinkD/wireguard-go"
)
sha256sums=(
  'SKIP'
  'SKIP'
)
backup=(etc/corplink/config.json)

build() {
  # build libwg
  cd "$srcdir/wireguard-go-git"
  make libwg
  cp libwg.* "$srcdir/$pkgname-git/libwg/"

  # build corplink-rs
  cd "$srcdir/$_pkgbase-git"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgbase-git"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 600 "config/config.json" "$pkgdir/etc/corplink/config.json"
  install -Dm 644 "systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm 644 "systemd/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
}
