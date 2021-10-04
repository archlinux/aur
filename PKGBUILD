# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-ipmi-exporter
_pkgname=ipmi_exporter
pkgver=1.4.0
pkgrel=2
pkgdesc="Prometheus exporter for IPMI metrics"
arch=(x86_64)
url="https://github.com/prometheus-community/ipmi_exporter"
license=('MIT')
makedepends=('go')
depends=('glibc' 'freeipmi')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'systemd.service'
        'sysusers.conf')
sha512sums=('7474d9f0f558426523940667c05e7c89d2813c0af97086fdc6f10fe533d05a555dff3bd55af781d80c19cc538de28b95eeae19bef2f0db9cfff0a33ef10a9e40'
            'fb373d8884167f1eea3efff0a1dd5518bf9033e9653c76fc551c2295348a5681871e545672771ffbd571190869097696f74cc6ce5439820aec1b1785f1c65cc3'
            '6a054c496a7cbfe1946713001d8fe460360bd42a473aa7cc0aed0fbfd4d989e67a62d4b4be7e9d828b4572dc06d6afedf16797ce58279b2d4b1c9343b5088feb')
b2sums=('1511324e2fe6a6f6301cdfc41da1fc34f5c63f6cf871702104b679ebc247694cebe786a009b9e6a3eea1683aff074d16a37ab7480812e36dcd9d047021c68136'
        'adae5f80306c13ef619c47a732eab9067c9f11ec025e7e46abb200f1c122d4cccd1c55cec99120e373022e1f798f4623bb93c9e8ff6801e6915a9d385a4ed8bd'
        '93e62d3bacccb26e808271fa4f576dc5e67cb5111f7d0c744a4f029aa3974de29742b4301f4058db38884de1cb049969c533291daf0fa6a9f3175a77c72b0001')

prepare() {
  cd "$_pkgname-$pkgver"

  # verify vendored dependencies
  go mod verify
}

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
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd "$_pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "$_pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ipmi*.yml docs/*.md README.md
}
