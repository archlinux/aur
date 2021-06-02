# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-ipmi-exporter
_pkgname=ipmi_exporter
pkgver=1.4.0
pkgrel=1
pkgdesc="Prometheus exporter for IPMI metrics"
arch=(x86_64)
url="https://github.com/soundcloud/ipmi_exporter"
license=('MIT')
makedepends=('go')
depends=('glibc' 'freeipmi')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'systemd.service'
        'sysusers.conf')
b2sums=('1511324e2fe6a6f6301cdfc41da1fc34f5c63f6cf871702104b679ebc247694cebe786a009b9e6a3eea1683aff074d16a37ab7480812e36dcd9d047021c68136'
        'adae5f80306c13ef619c47a732eab9067c9f11ec025e7e46abb200f1c122d4cccd1c55cec99120e373022e1f798f4623bb93c9e8ff6801e6915a9d385a4ed8bd'
        '93e62d3bacccb26e808271fa4f576dc5e67cb5111f7d0c744a4f029aa3974de29742b4301f4058db38884de1cb049969c533291daf0fa6a9f3175a77c72b0001')

build() {
  cd "$_pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$pkgver \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=someone@builder \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    .
}

package() {
  # systemd integration
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd "$_pkgname-$pkgver"

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "$_pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # docs
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ipmi_local.yml \
    ipmi_remote.yml \
    docs/configuration.md \
    docs/metrics.md \
    README.md
}
