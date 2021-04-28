# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=air
pkgver=1.27.3
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=(x86_64)
_url="github.com/cosmtrek/air"
url="https://$_url"
license=(GPL3)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('545d58c612573378062e94fa1d8c51e7109e58c80209a568db9ff206660912b6de0d3c52ab4b348d9533deabcaab0e7ed261a655a38cdf039826db0534e4936b')

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
