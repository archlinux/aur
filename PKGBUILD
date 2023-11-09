# Maintainer: tarball <bootctl@gmail.com>

pkgname=narrowlink-bin
pkgver=0.2.1
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
sha256sums_i686=('8f1d29c374ccb7f4338c635b6c98c6c234115bd2861b0174e5a2b2ea22f8423e'
                 'f19ebc2597d40ab4248bad8f8cf0d33dca60f2c3e797e16784a15e6e7fbd5f9a'
                 '74fc798483ea594e771fa215c73b0129425a6d5bb618870f9d4f475a959e604c'
                 '23af3e5815432b8b231dff5752c8fc824d417a39cca44cae12ce8744101007e7')
sha256sums_x86_64=('0289c62c1828196011977999f11995dc5ba86a58085fa5fb7db14d3ddc44e8aa'
                   '4a247278c617a2706790b94f495d00a09ec4b485dd1f3e645098ec0a76d2bdf9'
                   '84a38ccb2cc79270ad8db767b723d32b62794880cf53b11861083d4d663ae9ab'
                   'ef6242c9111056c5fdf47c7aca880f3348102febe5f320e482e63f12c225faea')
sha256sums_aarch64=('3456277d679589cd8eaf3cb62f2456c0b594249a05014227a3c032e8190a42b8'
                    'cc72ecf1b7870d2acbae706e5397eb5510e94169c4469d1c94ee67d9472bd4a8'
                    'e248b1245f7d8b31fcea4599d6a76cc5b54433374cfe6bc4138cf0d57936d59f'
                    '89695edca646d704ccb588dbfc273ffce5adf216cc6aa7ad556d2d288ce0ae5c')

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
