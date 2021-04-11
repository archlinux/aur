# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=air
pkgver=1.25
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=(x86_64)
_url="github.com/cosmtrek/air"
url="https://$_url"
license=(GPL3)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a701995a05f9f7191915b94b05457e68e56ea4da3a5e36ec201efeee265970ad26f7806b3bfa507d9b2b665e034af7cc2bee00ce890280afa9bf05e2936a485d')

prepare() {
  cd "$pkgname-$pkgver"
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS -X "main.Version=${pkgver}" -X "main.BuildTimestamp="$(date --iso-8601=seconds --utc)""" \
    "$_url"
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/$pkgname"

  # documentation
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgname-$pkgver/"{README.md,air_example.toml}
}
