# Maintainer: tarball <bootctl@gmail.com>

pkgname=narrowlink-bin
pkgver=0.2.3
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
sha256sums_i686=('a6d2aa2ac0c63add115c3e0222f26a61345fb923b05b9b23f128139a385e02fa'
                 '1784fb5b77f53718702c9a7f0e44e67289a6980d75ddc61aa6256c65a71986e2'
                 'd645d7b9270f47e3231890d170a48e9fe69803f06ad78a5a145cc4d29720d0b2'
                 'aabe341081c7fced499a52461f32dcf577f8e746e760973dfe146e6ece2a40f4')
sha256sums_x86_64=('f022fea303c0d5e3dd534a8196ae07aba5c09ef42f1ea0ad10aa5730bd756ff2'
                   '6dfd29d4ed09f54cb76ae7ebcc3a278c69dd3f788d7eb5ba27421228ce3b9d49'
                   '3f7a7246bea2f482610714f3a43c05d219de91f5e3ed9871864c1f6ddf3481a0'
                   '71d9917a42290c7b51f3bfacd7fe6d5e91297647ec308feae850c4b3b3121aca')
sha256sums_aarch64=('ada1f338e7a3693521a2b497b8c14ca4ee193ca8453ba9b6af1e0d622fabd590'
                    'f754f32aaef0dc9338d58998bf800e9db93a308cf9b16ad94cb45052beb21418'
                    '7b5f1b6cb363348a3327aa661692bb32ce869a54eec8f3339a290045be197f21'
                    'c52ce704f0495d381fbbf6e1afd1b38d60b7f795a0f687a1f6772d818e54b225')

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
