# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=rusty-keys
pkgver=0.0.1
pkgrel=1
pkgdesc="uinput level keyboard mapper for linux"
url="https://code.moparisthebest.com/moparisthebest/rusty-keys"
makedepends=('cargo' 'systemd')
depends=('libsystemd')
arch=('i686' 'x86_64')
license=('AGPL')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download"
        "$pkgname-$pkgver.tar.gz.asc::https://code.moparisthebest.com/attachments/97f6888b-df43-4e7c-a3f5-d4982b24341b"
        'rusty-keys@.service'
        rusty-keys.target
       )
validpgpkeys=('81F1C22DD41109D4A9C0A7B5B070F8D97D1A0BBA') # moparisthebest <admin AT moparisthebest.com>
sha256sums=('f26dd1a1b2005b82929e6bc64966f545834a1f77c1ed9221f7de42a3d6c84239'
            'SKIP'
            '4b8df8362d87c2aa31c028cf7aeaae109678f044f19be7ad2e492056e9d96b03'
            '70afa48c38901dd7de377f8ab4432806adeb944bd171df02091da617ed138862'
           )

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm644 'rusty-keys@.service' "${pkgdir}/usr/lib/systemd/system/rusty-keys@.service"
  install -Dm644 rusty-keys.target "${pkgdir}/usr/lib/systemd/system/rusty-keys.target"

  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rusty-keys "$pkgdir/usr/bin/rusty-keys"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 keymap.toml "${pkgdir}/etc/rusty-keys/keymap.toml"
}
