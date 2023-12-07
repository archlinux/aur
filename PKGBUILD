# Maintainer: Ed <me at edzz dot de>
pkgname=pgxman
pkgver=1.0.1
pkgrel=1
pkgdesc='PostgreSQL Extension Manager'
arch=('x86_64')
url="https://pgxman.com/"
license=('FSL-1.0-Apache-2.0')
makedepends=('go')
source=("https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('71f0986df8922df67fe20122776d6d46e7877233e3c52df3761f86d364c77a66')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/pgxman ./cmd/pgxman
  go build -o build/pgxman-pack ./cmd/pgxman-pack
}

check() {
  cd "$pkgname-$pkgver"
  go test $(go list ./... | grep -v e2etest) -count=1 -v
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/pgxman "$pkgdir"/usr/bin/pgxman
  install -Dm755 build/pgxman-pack "$pkgdir"/usr/bin/pgxman-pack
}

