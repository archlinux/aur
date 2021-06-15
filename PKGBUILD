# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-pgbouncer-exporter
_pkgname=pgbouncer_exporter
pkgver=0.4.0
pkgrel=1
pkgdesc="Prometheus exporter for PgBouncer metrics"
arch=('x86_64')
url="https://github.com/prometheus-community/pgbouncer_exporter"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('pgbouncer: for monitoring a local pgbouncer instance')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'systemd.service'
        'sysusers.conf')
b2sums=('db0906811fc02be92321f70699c1dab4fc942d05680ef5dc08ed4919bd82c6ae17bacc5d9ec51c8f1a34e864c85d5621b8859cf6f38736c77c2648ee495b842e'
        '68c1e1cde7d13b095681ddbe3a473b07508cbca6b882a43108ccb652a4c7e8d509bb432159d3dfc68b073645178ec204122789529757cdab141de0fed301f274'
        '324a833a5c46446612e21faa29221dbd35dccae309b9373e0431ca96ca59020abec9f3de5fde93c237a0385e754aa0b587d471f7b26c275dbcfe967e68f0ace9')

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

package() {
  # systemd files
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd "$_pkgname-$pkgver"

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "build/$_pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
