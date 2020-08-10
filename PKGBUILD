# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=air
pkgver=1.12.3
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=(x86_64)
_url="github.com/cosmtrek/air"
url="https://$_url"
license=(GPL3)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('72583dbd4c793100e17ff14f443d1a9459bd237e06ca7f82c73cc603f6914505d0e6bbbecc17c69f1710dfdf613cf449e9cde25c9091ceccfb05718643043f6e')

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

package() {
  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/$pkgname"

  # documentation
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgname-$pkgver/"{README.md,air_example.toml}
}
