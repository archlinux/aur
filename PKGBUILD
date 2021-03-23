# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-parallel-copy
pkgver=0.3.0
pkgrel=2
pkgdesc="A tool for parallel copying of CSV data into a TimescaleDB hypertable"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-parallel-copy"
license=('Apache')
depends=('timescaledb')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('1865dec51c3446fe32d62290cb268b6cb61fa405acb7bbc314984b25c381bacabe04f2ce870fa9a47405b2161aa64d2f4afb18c07ede27e34de8976c99924b13')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
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
