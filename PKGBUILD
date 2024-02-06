# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Birks <david@birks.dev>

pkgname=kube-score
pkgver=1.18.0
pkgrel=1
pkgdesc="Kubernetes object analysis with recommendations for improved reliability and security"
arch=(x86_64)
url='https://github.com/zegl/kube-score'
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5709c2ccb4a8589ca28287a1740555b00b3c3df9f61ef77ea32e7cbf631961e7')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  go mod download -x
}

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -buildvcs=false --ldflags "-X main.version=$pkgver" ./cmd/...
}

check() {
  cd "$_archive"

  go test ./...
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" kube-score
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
