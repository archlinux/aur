# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname=prometheus-json-exporter
_pkgname=json_exporter
pkgver=0.5.0
pkgrel=1
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
sha512sums=('b679c772075a54ae36f30d84942f4f00a9f73653456a80204bc97c4cecb7b02deaab096974e7b727d5cafb9e2f9bf592c05bd118912a1a42d514195cd3afdbc9'
            'fec356ad3b683e80cd3c8932f40278b49e475a048cec17978f102f0b5b191e1e6f84970bc99c205d1f0319d65999a00b6acdfac139127619f3cbe24ebdd74b9d')

prepare() {
  cd "$_pkgname-$pkgver"

  # create folder for build output
  rm -Rf build
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
  install -Dm755 "$_pkgname-$pkgver/build/$_pkgname" "$pkgdir/usr/bin/$pkgname"
}

