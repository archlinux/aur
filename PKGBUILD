# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-nextcloud-exporter
_pkgname=nextcloud-exporter
pkgver=0.5.0
pkgrel=2
pkgdesc="Prometheus exporter for Nextcloud metrics"
arch=('x86_64')
url="https://github.com/xperimental/nextcloud-exporter"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6592d0da5fe6c0721ab67d34a7384d2d4b441f0d82482db02e10f4e51f8c1f5f0e9ad0ae0e04fb911d8e7a0d232fbc6f12cc8cfc8f6aa2a5cf540aebd2c02d83')
b2sums=('4c59a399b0867ef3c5b078f34dacad2859fc3989db949c64d395a08e8d9552803fed140548714fa2e4fe990e181acb9ee624e631e85e03a47df925ff4de999f5')

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
    -X main.Version=$pkgver \
    -X main.GitCommit=tarball" \
    -o build \
    .
}

check() {
  cd "$_pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$_pkgname-$pkgver"

  # binary
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
