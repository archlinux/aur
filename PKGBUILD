# Maintainer: Marius Meschter <arch at meschter dot me>
pkgname=addlicense
pkgver=1.2.0
pkgrel=1
pkgdesc='Add license information to source code files'
arch=(x86_64)
url=https://github.com/google/addlicense
license=(Apache-2.0)
depends=()
makedepends=('go>=1.16')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/addlicense/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d2e05668e6f3da9b119931c2fdadfa6dd19a8fc441218eb3f2aec4aa24ae3f90')

prepare() {
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

  go build -o build .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
