# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=glinet-cli
pkgver=0.3.1
pkgrel=1
pkgdesc='CLI tool to manage GL.iNet router'
arch=(x86_64 aarch64)
url='https://github.com/antavik/glinet-cli'
license=('MIT')
conflicts=("${pkgname}-bin")
depends=(glibc)
makedepends=('go')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a9d3e84326b072c3983207999f177796109005b456a21281767210d48247564e')

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
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -ldflags="-s -w -linkmode=external -X main.version=v${pkgver}" -o "$pkgname" ./src

  # Clean up deps
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
