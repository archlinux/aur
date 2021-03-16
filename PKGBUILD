# Maintainer: Alkindi42

pkgname=dasel
pkgver=1.13.4
pkgrel=1
pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url="https://github.com/TomWright/dasel"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TomWright/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('a3f68ca90d518040638e81d9e71bb7420719893700ba4a771a236462a25d474d')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X main.BuildDate=$(date -u '+%Y-%m-%dT%I:%M:%S%p')" \
    -o $pkgname ./cmd/dasel/main.go 
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 dasel "$pkgdir/usr/bin/dasel"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
