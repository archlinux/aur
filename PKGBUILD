# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=jd-tool
_pkgname=jd
pkgver=2.1.2
pkgrel=1
pkgdesc="JSON diff and patch"
arch=(x86_64 aarch64)
url="https://github.com/josephburnett/jd"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6c39b278a6309e43a00e5c7cb79c838c71263c997f95f8e1ec3c980bccb11a5d')

prepare() {
  cd $_pkgname-$pkgver
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd $_pkgname-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw -buildvcs=false"
  export GOPATH="$srcdir"
  local ld_flags=" \
    -compressdwarf=false \
    -linkmode=external \
  "
  go build -v -ldflags "$ld_flags"
}

check() {
  cd $_pkgname-$pkgver
  local unit_tests=$(
    go list ./... | grep -v github.com/josephburnett/jd/web/ui
  )
  # shellcheck disable=2086
  go test $unit_tests
}

package() {
  cd $_pkgname-$pkgver
  install -vDm755 -t "$pkgdir/usr/bin" jd
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
