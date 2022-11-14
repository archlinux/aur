# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=redli
pkgver=0.7.0
pkgrel=1
pkgdesc="A humane alternative to the Redis-cli and TLS"
arch=(x86_64)
url=https://github.com/IBM-Cloud/redli
license=(Apache)
depends=(glibc)
makedepends=(go)
source=(https://github.com/IBM-Cloud/redli/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha256sums=('1698c7a98bb41cde98d3b1c28c9b02411f86973b3e14ba35bd79229b6422f4da')

prepare() {
  cd redli-$pkgver
  export GOPATH="${srcdir}/gopath"
  go mod vendor
}

check() {
  cd redli-$pkgver
  go test ./...
}

build() {
  cd redli-$pkgver
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o redli
}

package() {
  cd redli-$pkgver
  install -Dm0755 redli "$pkgdir/usr/bin/redli"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
