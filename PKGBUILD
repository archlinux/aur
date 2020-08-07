# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=air
pkgver=1.12.2
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=(x86_64)
_url="github.com/cosmtrek/air"
url="https://$_url"
license=(GPL3)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ccc425b0575c0c8d95beb6e4ec90dc8baea12d4910677760ee9f514a592ef093318a1a0f6a9cdaa1ce17129425629f20c7a2c74a23fd24955e405628503b5abe')

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
