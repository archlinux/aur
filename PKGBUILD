# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=templ
pkgver=0.3.1100
pkgrel=1
pkgdesc="A language for writing HTML user interfaces in Go"
arch=(x86_64)
url=https://templ.guide
license=(MIT)
depends=(glibc)
makedepends=(go)
checkdepends=(gopls prettier)
source=(https://github.com/a-h/templ/archive/v${pkgver}/$pkgname-$pkgver.tar.gz)
sha256sums=('9f1b7f1aa87f10d2eab5ade1e732a6c48d3a26b40762f6e005bbc9efdcfeca99')

prepare() {
  cd $pkgname-$pkgver
  export GOPATH="${srcdir}/gopath"
  go mod download
}

build() {
  cd $pkgname-$pkgver

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"

  export GOPATH="${srcdir}/gopath"

  go build \
    -o templ \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd/templ
}

check() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir/gopath"
  go test -mod=readonly ./...
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 templ "$pkgdir/usr/bin/templ"
  install -vDm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
