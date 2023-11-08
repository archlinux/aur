# Maintainer: tarball <bootctl@gmail.com>

pkgname=narrowlink-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Securely connect devices and services, even in restricted networks'
url='https://narrowlink.com'
arch=(i686 x86_64 aarch64)
license=(MPL2 AGPL3)
provides=(narrowlink narrowlink-agent narrowlink-token-generator narrowlink-gateway)
conflicts=("${provides[@]}")

_base="https://github.com/narrowlink/narrowlink/releases/download/$pkgver/narrowlink"

source=(narrowlink.service.in)
source_i686=(
  narrowlink-agent-i686-$pkgver::$_base-agent-i686-unknown-linux-musl
  narrowlink-gateway-i686-$pkgver::$_base-gateway-i686-unknown-linux-musl
  narrowlink-i686-$pkgver::$_base-i686-unknown-linux-musl
  narrowlink-token-generator-i686-$pkgver::$_base-token-generator-i686-unknown-linux-musl
)
source_x86_64=(
  narrowlink-agent-x86_64-$pkgver::$_base-agent-x86_64-unknown-linux-musl
  narrowlink-gateway-x86_64-$pkgver::$_base-gateway-x86_64-unknown-linux-musl
  narrowlink-token-generator-x86_64-$pkgver::$_base-token-generator-x86_64-unknown-linux-musl
  narrowlink-x86_64-$pkgver::$_base-x86_64-unknown-linux-musl
)
source_aarch64=(
  narrowlink-aarch64-$pkgver::$_base-aarch64-unknown-linux-musl
  narrowlink-agent-aarch64-$pkgver::$_base-agent-aarch64-unknown-linux-musl
  narrowlink-gateway-aarch64-$pkgver::$_base-gateway-aarch64-unknown-linux-musl
  narrowlink-token-generator-aarch64-$pkgver::$_base-token-generator-aarch64-unknown-linux-musl
)
sha256sums=('5248b868c9a6f42fdf7c392525bbe238b54ff564fb0d59999d5af4b8d0aa84aa')
sha256sums_i686=('b9e8a46b00413ed9f54055b1bf2a1be804ac73e6dbd23eeb92d4d17eb175d618'
                 '8c01b0060c3c93d0c4f4cdae999ca73bd839637ff7d365989e7143b24aed528b'
                 '9bae1c9b51c4e6711b8abc34bafbff7e41521a10b4ef958c3e654b5bbb4bce27'
                 '3059a4a37ef8b640925b94747669d8384f24ad316960f04d428f1406944a4719')
sha256sums_x86_64=('59a63a54dcbbc16cc9aa09fbdded949a879ce5a31beda879c8bfb6601175169a'
                   '1a31fd6936947db1c926eb951874828e63396cadd9c9d2a6b79e2d93726f3937'
                   '382280ed08f855b4002d311807ef4da552a4f1264e16e5dcd968690d1a1ca628'
                   '594c440785b51d13c20051b14365b0c0fc86315b37f3eda5e8504d621c05c0d8')
sha256sums_aarch64=('57339ffddb16421cc3992435c11ae50890986b83d0f2b57ba029d283f06bb26d'
                    'ec7b15acd3fc453b1512ef1aaac375dd86ae4ec135923b8649a9b317ec8bc01d'
                    '67b5b4740a8676dc3613cd9af4828f05ad94657c513f81c83643fbfa54cada60'
                    '9efcac54a7ef7353f5a57964ed2acaec65bf1a9b9aadf6c3a0229ee74d59e969')

# Splitting this into four separate packages would be a bit too much IMHO
package() {
  install -Dm755 "narrowlink-$CARCH-$pkgver" \
    "$pkgdir/usr/bin/narrowlink"

  install -Dm755 "narrowlink-agent-$CARCH-$pkgver" \
    "$pkgdir/usr/bin/narrowlink-agent"

  install -Dm755 "narrowlink-gateway-$CARCH-$pkgver" \
    "$pkgdir/usr/bin/narrowlink-gateway"

  install -Dm755 "narrowlink-token-generator-$CARCH-$pkgver" \
    "$pkgdir/usr/bin/narrowlink-token-generator"

  install -dm700 "$pkgdir/etc/narrowlink"
  install -dm755 "$pkgdir/usr/lib/systemd/system"

  for svc in agent gateway; do
    sed "s/__NAME__/$svc/g" \
      <narrowlink.service.in \
      >"$pkgdir/usr/lib/systemd/system/narrowlink-$svc.service"
  done
}
