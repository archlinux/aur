# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=prometheus-json-exporter
_pkgname=json_exporter
pkgver=0.4.0
pkgrel=2
pkgdesc="Prometheus exporter which scrapes remote JSON by JSONPath"
arch=('x86_64')
url="https://github.com/prometheus-community/json_exporter"
license=('Apache')
depends=('glibc')
makedepends=('go')
options=(!lto)
backup=(etc/prometheus/json.yml)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'systemd.service'
)
sha512sums=('43d4a141fc0771ca4105502b7e5c37acd599287145e958206b1e5c853df87b22a828a4bb63c9056350da3e06c448a05f136896ae536239d6715325c54426d71d'
            'fec356ad3b683e80cd3c8932f40278b49e475a048cec17978f102f0b5b191e1e6f84970bc99c205d1f0319d65999a00b6acdfac139127619f3cbe24ebdd74b9d')

prepare() {
  cd "$_pkgname-$pkgver"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$_pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$pkgver \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=someone@builder \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o build .
}

check() {
  cd "$_pkgname-$pkgver"
  go test ./...
}

package() {
  # systemd integration
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  # example config
  install -Dm644 "$_pkgname-$pkgver/examples/config.yml" "$pkgdir/etc/prometheus/json.yml"

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "$_pkgname-$pkgver/build/$pkgname"
}

