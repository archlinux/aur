# Maintainer: Alkindi42

pkgname=sqlc
pkgver=1.6.0
pkgrel=1
pkgdesc="Generate type safe Go from SQL "
arch=('x86_64')
url="https://github.com/kyleconroy/sqlc"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kyleconroy/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('a95a123f29a71f5a2eea0811e4590d59cbc92eccd407abe93c110c738fc4740b')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X main.BuildDate=$(date -u '+%Y-%m-%dT%I:%M:%S%p')" \
    -o $pkgname ./cmd/sqlc/main.go 
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 sqlc "$pkgdir/usr/bin/sqlc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
