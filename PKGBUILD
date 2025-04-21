# Maintainer: Marius Meschter <arch at meschter dot me>
pkgname=addlicense
pkgver=1.1.1
pkgrel=1
pkgdesc='Add license information to source code files'
arch=(x86_64)
url=https://github.com/google/addlicense
license=(Apache-2.0)
depends=()
makedepends=('go>=1.16')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/addlicense/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db7990c110d2c38d2463425bc5be3617b43dbb64bea6fdd169a77800d755665e')

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
