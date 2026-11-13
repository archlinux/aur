# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Gyorgy Abraham <gyorgy.abraham@protonmail.com>
# Contributor: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=goose
pkgver=3.30.1
pkgrel=1
pkgdesc="Database migration tool written in Go"
arch=(i686 x86_64)
url=https://github.com/pressly/goose
license=(MIT)
depends=(glibc)
makedepends=(go)
source=(${url}/archive/v${pkgver}/$pkgname-$pkgver.tar.gz)
sha256sums=('256e67dc83959a7febb27388d0f9b1efcc51bae5e53db31cb9bf20f3cfb468d2')

prepare() {
  cd $pkgname-$pkgver
  export GOPATH="${srcdir}/gopath"
  go mod download
}

check() {
  cd $pkgname-$pkgver
  # disable tests for now... they require a running docker postgres container
  # go test -v -mod=readonly ./...
}

build() {
  cd $pkgname-$pkgver

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"

  export GOPATH="${srcdir}/gopath"

  go build \
    -o goose \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd/goose
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 goose "${pkgdir}/usr/bin/goose"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
