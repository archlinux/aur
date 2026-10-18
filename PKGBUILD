# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=redmine-tui
pkgver=2.0.0
pkgrel=1
pkgdesc="Terminal UI for Redmine: kanban board, time logging, status updates"
arch=('x86_64' 'aarch64')
url="https://github.com/omertahaoztop/redmine-tui"
license=('MIT')
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b23bd4b2231e16f02938a2232ae53ce71868691729ff8ac12c727df322413d36')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -ldflags="-linkmode=external -X main.version=v${pkgver}" -o "$pkgname" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  go clean -modcache
}

