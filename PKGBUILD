# Maintainer: Luis Sanchez <dceluis@outlook.com>
pkgname=process-compose
pkgver=1.46.0
pkgrel=1
pkgdesc="Process Compose is a simple and flexible scheduler and orchestrator to manage non-containerized applications."
arch=('x86_64')
url="https://github.com/F1bonacc1/process-compose"
license=('MIT')
options=('!debug')
makedepends=('go>=1.22.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/F1bonacc1/process-compose/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

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

  go build -o build/$pkgname ./src/main.go
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
