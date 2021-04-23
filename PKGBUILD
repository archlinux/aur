# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=yajsv
pkgver=1.4.0
pkgrel=1
pkgdesc="Yet Another CLI JSON Schema Validator"
arch=('any')
url="https://github.com/neilpa/yajsv"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b177bc924635b1cfbe2826d6c346d58d110e1cfdaea113d13fbc46cdeb40496bc80d57919c298118eca6d59acc0ce645b0a9bc97ffc0c2dd49199cb24ce541c7')

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
