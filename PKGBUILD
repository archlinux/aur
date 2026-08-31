# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=tailcat
pkgver=0.4.0
pkgrel=1
pkgdesc="like netcat, but over Tailscale's data plane, without Tailscale's control plane"
url='https://github.com/tailscale/tailcat'
arch=(aarch64 x86_64)
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3e87753aa45f8be249a2708a4220748fd8613f9ea0d0435a48ffedf8d724247')

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

  go build -ldflags="-linkmode=external -X main.version=v${pkgver}" -o "$pkgname" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  go clean -modcache
}

