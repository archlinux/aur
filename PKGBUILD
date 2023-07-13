# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Birks <david@birks.dev>

pkgname=kube-score
pkgver=1.17.0
pkgrel=1
pkgdesc="Kubernetes object analysis with recommendations for improved reliability and security"
arch=(x86_64)
url='https://github.com/zegl/kube-score'
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d5a3258b08b2e6562a6000215d461e46607d50b738f56a8b8bb2bc48be29e7f')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build --ldflags "-X main.version=$pkgver" ./cmd/kube-score
}

check() {
  cd "$_archive"

  go test ./...
}

package() {
  cd "$_archive"

  install -Dm755 kube-score "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
