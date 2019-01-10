# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=rusty-keys
pkgver=0.0.2
pkgrel=1
pkgdesc="uinput level keyboard mapper for linux"
url="https://code.moparisthebest.com/moparisthebest/rusty-keys"
makedepends=('cargo' 'systemd')
depends=('libsystemd')
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('AGPL')
backup=('etc/rusty-keys/keymap.toml')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download"
        "$pkgname-$pkgver.tar.gz.asc::https://code.moparisthebest.com/attachments/033ae7d4-51f6-498a-886a-7d9d4af00c5d"
        'rusty-keys@.service'
        rusty-keys.target
       )
validpgpkeys=('81F1C22DD41109D4A9C0A7B5B070F8D97D1A0BBA') # moparisthebest <admin AT moparisthebest.com>
sha256sums=('53cb47fc17c69430d5f8d2230e712a1178f14d8542d21bda4b0d8bd022019804'
            'b93319c75923c11ccffa07e58ba9dee9f2a7ddd65c5d5aaccfa49027bae6cd33'
            '277193fd54d47d994d2db21102409c1aa18f11064e9f4798bd97ade63cbe2c46'
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
