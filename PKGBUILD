# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: David Birks <david@birks.dev>

pkgname=kube-score
pkgver=1.19.0
pkgrel=1
pkgdesc="Kubernetes object analysis with recommendations for improved reliability and security"
arch=(x86_64)
url='https://github.com/zegl/kube-score'
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cf2bf6372e7ec29a91bd38611d7bede4b75e073a564adbb7b7fbb1c3e4ff7f7a')

prepare() {
  cd "$pkgname-$pkgver"
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw -buildvcs=false"
  export GOPATH="$srcdir"

  local ld_flags="-compressdwarf=false -linkmode=external -X main.version=$pkgver"
  go build -v --ldflags="$ld_flags" ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" kube-score
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
