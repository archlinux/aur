# Maintainer: tarball <bootctl@gmail.com>

pkgname=narrowlink-bin
pkgver=0.2.5
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
sha256sums_i686=('fd61fd8d323dccd3ff7d5d7a3b94368c28e8cc7cb71ef04011f0a3762596cd40'
                 '482737d8e14c4c208e60f3a0585335576ee4a72df31d6d5d7e410036347ccb02'
                 'f5e4bbc9d882cbe7201cc293636ad751af37742943a44fc0e8fd880070423c39'
                 '0075c85c9a90e630b7e55094fab04085b233d7b6d18833ee589c394a4e0f0a27')
sha256sums_x86_64=('1c1804621f4beb89c789465c17a2f1d04468f97e727efe16630fd9e934758aa0'
                   '3c3b0d54eec43963aa34bb56230d1a7a3259b3c654ba11c44282343b486abd36'
                   '40cdd6b0705076e9c409b3d55cef9163064f8d2ac544189c8104ef24e0f36796'
                   '6f225008a1fbeb001d0db65cec1146f290a2a97d644b282904e5272764a1d401')
sha256sums_aarch64=('bbcc253a432abfeb0c10406e3593d42f1dfe1e5aad2902ef3398ffd45571aa68'
                    'c8555bc991b3f599a43dfa6fea09c2e3327d9e1c8ac93bd271a8e1472089dc6d'
                    '1d0437a2fd8300f0e35074e119ddf29b75d68e58caaeb2a4c562458c80089fe8'
                    'f0562cfc56a7c3ed7276aeba09a41cd790d7aa0e184d58fca123ed9527a6ca9f')

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
