# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-tune
pkgver=0.11.2
pkgrel=1
pkgdesc="A tool for tuning TimescaleDB for better performance"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-tune"
license=('Apache')
depends=('postgresql')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9d8a3a01021b6cab0cffa3567560b4ff3d30fb88c8400f767036c777a9b7914376e7be8d913d9962c0617846f3bfcb22d1ab085dd63f95a1371cdbc3f1ad596a')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir build
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    ./cmd/...
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/build/$pkgname"
}
