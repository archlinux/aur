# Maintainer: ml <>
pkgname=golang-mockery
_pkgname=${pkgname##golang-}
pkgver=2.9.4
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('x86_64')
url='https://github.com/vektra/mockery'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9c490eaa5dd509581e7c272d6af22b17c22b2915267e242ce927f17850ff4a59')

build() {
  cd "$_pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o bin/"$_pkgname" -ldflags "-linkmode=external -X github.com/vektra/mockery/v2/pkg/config.SemVer=$pkgver"
}

# TODO: review
#check() {
#  cd "$_pkgname-$pkgver"
#  go test ./...
#}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 bin/"$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
