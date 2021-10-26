# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-ssl-exporter
_pkgname=ssl_exporter
pkgver=2.3.1
pkgrel=1
pkgdesc="Prometheus exporter for TLS certificates"
arch=('x86_64')
url="https://github.com/ribbybibby/ssl_exporter"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e3c1123ff07a07215794ef55f891e16f57a118611cb621f112d671013c253f3d81fe9d9c9470c89065ab578181faa99f8fe012de031219677e393b941a8b9d6c')
b2sums=('ca60ff07339f303d343f4007a08122ce449f73cf1be8eef3c491ac4ca6fb4942b6e007d8442f54fc87a2c8c404a72aa12c8cd78469a561fa3e32d7c82f0c04e2')

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
    -mod=readonly\
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$pkgver \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=someone@builder \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o build ./...
}

check() {
  cd "$_pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$_pkgname-$pkgver"

  # binary
  install -vDm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_pkgname-$pkgver/LICENSE"
}
