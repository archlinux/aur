# Maintainer: tarball <bootctl@gmail.com>

pkgname=narrowlink-bin
pkgver=0.1.2
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
sha256sums=('2f596a79cac41bde25dd610d1aa1580509412556a8a0cb36c0e7226ea11b67db')
sha256sums_i686=('ed2e6c56b7a1e70acc30989c84402024ff888cf2f22ac0a079a8c6b625099432'
                 'bf49f2d2060c48bd0748ba7593cf432006cc66b356b25cb3ee749561848e27d2'
                 '8bbfecd97e0180ef7880a82b103265b2f93dcc766c8ba44e89a8e0c2717ae926'
                 'f7f71892b874785a2ac6f7045d6ed634822f255d822b3317596c7c438c3a053e')
sha256sums_x86_64=('67e39793812e0dc20dad99a0b0452fdb3b7d117cfb6613c3b8d7edc014e1a37f'
                   '2702c3e2dcd7eea77378823453434a9b21b5943e4eb9214389e6305517999e3e'
                   'd33bf5673e43ca7d30a661bfb45c8fe48f0164d8aae03687352bc464b98d335e'
                   '2826169ffb9ef01d07769fa180c8a578c3fc15558545272a98ea12d763850c3e')
sha256sums_aarch64=('b404cd9aa2e29db2ac2d359ca8f5faf757fefeb841515fa0bebdafc4fc29eb4c'
                    'a1892f15d3c185536b0effc76e8936f066ca4b0088dbd6f52a3b9651b3130fab'
                    '8a7b562e21c5a3a94ebcd87e88387c78accff966af07519840f1c635cd410bf6'
                    '849bcf173176b9d0b2c85e76f3c04f31a5eaccb7068f28b5fbdfacd6c610a52e')

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
