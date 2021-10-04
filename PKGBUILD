# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=nextdns-bin
pkgver="1.37.2"
pkgrel=1
pkgdesc="NextDNS CLI client (DoH Proxy)"
url="https://github.com/nextdns/nextdns"
arch=(x86_64)
license=(MIT)
depends=()
provides=(nextdns)
conflicts=(nextdns)
backup=(etc/nextdns.conf)

source=(
  https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_amd64.tar.gz
  nextdns.service
)
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=(
  a8f66d41d9e7858ca6f27ebf2504eb0564b9208725ea58f5f13fa28442fedb67
  SKIP
)

build() {
  cd $srcdir
  # post-install:
  # - set a value for key config
  # - consider changing value of keys listen and report-client-info
  # - NB: setup-router overrides listen
  ./nextdns config list | sort > nextdns.conf
}

package() {
  install -Dm 755 nextdns ${pkgdir}/usr/bin/nextdns
  install -Dm 644 $srcdir/nextdns.conf "$pkgdir/etc/nextdns.conf"
  install -Dm 644 $srcdir/nextdns.service "$pkgdir/usr/lib/systemd/system/nextdns.service"
  install -Dm 644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
