# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=go-yq
pkgver=3.4.1
pkgrel=1
pkgdesc='portable command-line YAML processor'
arch=(x86_64)
url=https://github.com/mikefarah/yq
license=(MIT)
makedepends=(go)
conflicts=(yq)
source=(https://github.com/mikefarah/yq/archive/${pkgver}.tar.gz)
sha256sums=('73259f808d589d11ea7a18e4cd38a2e98b518a6c2c178d1ec57d9c5942277cb1')

prepare() {
  cd yq-$pkgver
  go mod vendor
}

check() {
  cd yq-$pkgver
  go test ./...
}

build() {
  cd yq-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o yq
}

package() {
  cd yq-$pkgver
  install -Dm755 yq "$pkgdir/usr/bin/yq"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
