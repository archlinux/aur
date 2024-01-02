# Maintainer: tarball <bootctl@gmail.com>

pkgname=narrowlink-bin
pkgver=0.2.2
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
sha256sums_i686=('fae5f1ef6a1f8b6e6a17cb183d56c3a3ac92fb0ef163e2731676fcc37eef5c5f'
                 '0a0c627c2541efe12df58e39d78a2945142f4c41b1cc0368ea36bf9ba57312ad'
                 '4f666975fe4f3a5477a985f9b7c5233a1db99a08c44be3db20aff6c917a1fbab'
                 '67cae8abe3703a1ab816bfd1f84766ee04a23f03929b851452ad66d1ad6bc8e6')
sha256sums_x86_64=('c05d33335fb62df2dde046f8bd1b3af41e7c4a96a1a12ad89c2f5bb0be6d3fa7'
                   'b7b22b158031d5d82a1075b465443e2fe570c87b411f74df7f6698663ebbfcf0'
                   '6f9188105827e707779075a2b6f5dbe8acb215ef2e4ed119b792b9bd2496d44e'
                   'ae778d8289eef33bb253378b83047b00f7f561741f7948fbf054f3c45589a34a')
sha256sums_aarch64=('c114a7134ec540fdd8a093b936cd06b8fd1ad790f0fa370e0e18bf6c3f67ba9e'
                    '54d0065b60a11e006c9eff7cb540a08115a9ac75fef3300c883382677a5974cb'
                    '1cd0e68c44fbe652fec6e4cca10e52e27c65a35265b7d7e0512652e2cd960f2d'
                    '06040bcf2549c0adf69ce3499d549bc6c461a64958e7be8a60e6eadfbc1ca829')

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
