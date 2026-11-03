# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname='grype'
pkgver=0.121.1
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
license=(Apache-2.0)
arch=(aarch64 x86_64)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e3037387939d3230531571d712baf180a96d0ace60042c2f7e15e6b6e7a3f127')

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

