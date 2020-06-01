# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=license-detector
_pkgname="go-$pkgname"
pkgver=4.0.0
pkgrel=1
pkgdesc="Reliable project licenses detector"
arch=('x86_64')
url="https://github.com/go-enry/go-license-detector"
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bfa05f73958a45efb5760a3a3e74ee46030c3f2bac232b67a6d3b046a3c0840e89880b5b26c4dc0e97985617630745f4a76192dc1bfb527f65419a2eebe0fe25')

prepare() {
  cd "$_pkgname-$pkgver"
  go mod vendor
  mkdir -p build
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"
  go build -o build ./cmd/...
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$_pkgname-$pkgver/build/$pkgname"
}
