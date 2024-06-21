# Maintainer: tarball <bootctl@gmail.com>

pkgname=narrowlink-bin
pkgver=0.2.6
pkgrel=1
pkgdesc='Securely connect devices and services, even in restricted networks'
url='https://narrowlink.com'
arch=(i686 x86_64 aarch64)
license=(MPL-2.0 AGPL-3.0-only)
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
sha256sums=('b60d1792b67d877064fd8164177f2d5dca7e220e42e0679f53216a4ec8a6f46d')
sha256sums_i686=('0fc3183c257e9f19cefd56e7dbe35553bc3150dcec9460fd13e311d58fefa969'
                 '55355171b3fe46b2e236eb66520646d0f8547080794d12e5319db97beda7e859'
                 '276635866e116d50640bcefacba0ff4e28161e462cd53ed2115bb4eea05ed9f9'
                 '5c7422c8b3790f9d4979ca40d1dc2303f7ec130c5c920c9fcaa31dbbba271af2')
sha256sums_x86_64=('a5e8b6aacc9c5410c386fce2efc216e8d5c414825bb7058a182897ff1648a3aa'
                   '9f368a11121355fa7aa0facc69d92b67a33a14a22e8d9cb7b35f0404d1986d3b'
                   'f247125d9e8d899ed656ad2497f65b4e77c22dad2a25011b5c00b519a2a6211b'
                   'b6bcf110469503ee91f63c97615e9d174d6a11d6ab4ae941be171f9998225c4e')
sha256sums_aarch64=('703489704a5f1858f086f7ee8493e19c0f50bf97eb8f83801677a3a8cc2f8487'
                    '4a9f85b0343f1f57a5e458417090a3049de819146c128435d9545b758eb511af'
                    '4521c690563cb711f0f47196c89351d7f4e9656765564a491adaaf1c2bbeeb63'
                    '542379b34c933a01adaa88595be8a650ca9a0001390e80c11af7d487377f1016')

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
