# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=air
pkgver=1.26.0
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=(x86_64)
_url="github.com/cosmtrek/air"
url="https://$_url"
license=(GPL3)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bd5a5388ca54b33e5b927b819aecfead4e62998dbae6c2d4c67bf6f902781830421746dc3efb6b2ba266cc39f880afe6c0c57ea628c6b67d37a54ef1bf4f39b8')

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
