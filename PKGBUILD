# Maintainer: Markus Pesch <markus.pesch plus apps at cryptic.systems>

pkgname=prometheus-fail2ban-exporter
_pkgname=fail2ban-prometheus-exporter
pkgver=0.7.2
pkgrel=1
pkgdesc="Fail2Ban exporter for Fail2Ban metrics"
arch=('x86_64')
url="https://gitlab.com/hectorjsmith/$_pkgname"
license=('MIT')
makedepends=('go')
optdepends=('fail2ban: for monitoring a local fail2ban daemon')
source=(
  "$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz"
  'systemd.service'
  'sysusers.conf'
)
sha512sums=('b7691cc31c747965b8ac9e8f818d4411b716888be5c84c51bbe5e206022bf9b60f95abddc37c8011a412a40ba0665107e957a55b3acba5018fd5be85c442380e'
            '35747b143d7aed606ce25673061603d6c5b1623fb86c180aaa0a23f6afde26f4d2cde99d05cc1cc7fd7d8ccacbb6d3413cfcfcc3f26f7530d1f0d9151877b4d1'
            'c070f57c58f367421835fe757b6b46e4c6cc3a69e0e927b10c229daab945fc52e57acdf25a84f04f752cb7304c40c2ff95e7987daf41c80f8857d409def1752f')
b2sums=('87ab07b334594ecb792d817abb9bca1c7565be64df79d6dfa5edd268241534345a9e7e5b782dfcfd623d6a63db77b8803c614e44c3d44f9b7ca6b41952c6eb20'
        'a4ff2f3da50e353f8cfdca96de54a5fa83a2bcd12cf7a7c873b4cf4a55e745e35593b0d13a77edd6ade51ce582c6001d2241bd20491269538880e2b9e0816181'
        '4b731a290e1ad967f9e7708b00d4b9279bdbc57461c62d09a8bff00958e72cb8e69848d73af486bcc9e58ffe1e087ca86dc2625770a25ebd47e41d7bba193bef')

build() {
  cd "$_pkgname-$pkgver/src"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -o fail2ban-exporter .
}

package() {
  # systemd integration
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/fail2ban-exporter.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/fail2ban-exporter.conf"

  # binary
  install -D --mode 0755 --target-directory "$pkgdir/usr/bin" "$_pkgname-$pkgver/src/fail2ban-exporter"
  install -D --mode 0755 --target-directory "$pkgdir/usr/share/licenses/$pkgname" "$_pkgname-$pkgver/LICENSE"
}
