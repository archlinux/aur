# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=yajsv
pkgver=1.4.1
pkgrel=1
pkgdesc="Yet Another CLI JSON Schema Validator"
arch=('any')
url="https://github.com/neilpa/yajsv"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08118f3614231f3c5f86f4f68816e706e120b8c91cdf6c1caaea45a71e3e5943')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"
  go get
  go build -v -o "$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
