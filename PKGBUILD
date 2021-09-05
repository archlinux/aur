# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-nut-exporter
_pkgname=nut_exporter
pkgver=2.2.2
pkgrel=1
pkgdesc="Prometheus exporter for Network UPS Tools metrics"
arch=('x86_64')
url="https://github.com/DRuggeri/nut_exporter"
license=('Apache')
makedepends=('go')
optdepends=('nut: for monitoring a local NUT server')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'systemd.service'
  'sysusers.conf'
)
b2sums=('2c4d3efa18f45c4736d3d0e58d568d5fbbc3d7e4d926dabc530a6b793add90b06cb28d3792f0fdc6da3747efa1045e3f2d64035984baeb0285a5b1d3bae26aad'
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
  # ensure tests have access to built binary
  PATH="$(pwd)/build:$PATH" go test ./...
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "$_pkgname-$pkgver/build/$_pkgname"
}
