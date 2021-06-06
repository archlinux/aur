# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-nut-exporter
_pkgname=nut_exporter
pkgver=2.2.1
pkgrel=1
pkgdesc="Prometheus exporter for Network UPS Tools metrics"
arch=('x86_64')
url="https://github.com/DRuggeri/nut_exporter"
license=('Apache')
depends=('glibc')
makedepends=('go')
optdepends=('nut: for monitoring a local NUT server')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'systemd.service'
  'sysusers.conf'
)
b2sums=('98280b64257e38f8288e586ab36faa3d65bb774847c659c758e02cdbcfc2b883a2e9a08149eaeb87635baee6868818547a7816266149f0c893eb788c814feaa2'
        'c37fea15866ccc283ca0aca7ac47edf746b3281bbdc9bb92edde41d110b459d55272aff30b963cda5d3165c9ea27f2cc82b48b0f340900531cc125dd0d719c97'
        'f14c79da6b3efeb0843853e5772bcc021bd6041b76a39952ad45638ce27f143b41f6a491d528992250db9b2d9fd133b76ad8f6f6da9df4c6fb0865766d49d991')

prepare() {
  cd "$_pkgname-$pkgver"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod vendor
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
    -o build .
}

check() {
  cd "$_pkgname-$pkgver"
  PATH="$(pwd)/build:$PATH"
  go test ./...
}

package() {
  # systemd integration
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "$_pkgname-$pkgver/build/$_pkgname"
}
