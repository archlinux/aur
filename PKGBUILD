# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=transqlate
pkgver=0.1
pkgrel=1
pkgdesc="Transpile SQL snippet from a dialect to another using an AST"
arch=(x86_64)
url="https://gitlab.com/dalibo/transqlate"
license=(PostgreSQL)
makedepends=(go)
depends=(glibc)
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('f154b7f71ff065c242d09cc5e9aafc0e1599142b5c49db6ace62c32c5e3515c8')

_archive="$pkgname-v$pkgver"

prepare() {
  cd "$_archive"

  # Avoid downloading Go dependencies in build() by doing it here instead
  go mod download -x
}

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  # shellcheck disable=2153
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local ldflags="-linkmode=external -X 'main.version=$pkgver'"
  go build -v -buildvcs=false -ldflags "$ldflags"
}

check() {
  cd "$_archive"

  go test -v ./...
}

package() {
  cd "$_archive"

  install -Dm755 transqlate "$pkgdir/usr/bin/transqlate"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
