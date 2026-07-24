# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=skeema
pkgver=1.14.1
pkgrel=1
pkgdesc='Declarative pure-SQL schema management for MySQL and MariaDB'
arch=(x86_64 aarch64)
url='https://github.com/skeema/skeema'
license=('Apache-2.0')
conflicts=("${pkgname}-bin")
depends=(glibc)
makedepends=('go')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c38cbf5aed5dccce918da3fab1be97bbe21ae3422bf74deb9cf40529e1b84b1')

prepare() {
  cd "$pkgname-$pkgver"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "build/$pkgname" .

  # Clean up deps
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
