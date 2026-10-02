# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname='grype'
pkgver=0.120.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
license=(Apache-2.0)
arch=(aarch64 x86_64)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8bf9e1c197a956dade39879d75836d519a075baa744a0dec45a8ac3d042a3d3d')

prepare() {
  cd "${pkgname}-${pkgver}/cmd/$pkgname"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}/cmd/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags="-linkmode=external -X main.version=v${pkgver}" \
    -o "$pkgname" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  go clean -modcache
}

