# Maintainer: ml <ml@visu.li>
pkgname=golang-mockery1
_pkgname=mockery
pkgver=1.1.2
pkgrel=2
pkgdesc='A mock code autogenerator for golang'
arch=('x86_64')
url='https://github.com/vektra/mockery'
license=('BSD')
depends=('glibc')
makedepends=('go')
provides=('golang-mockery')
conflicts=('golang-mockery')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d2516fad4774252604f3a1708a1ac8f5f0162a9a1613bc65870c4018c98ed17a')

build() {
  cd "$_pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o bin/"$_pkgname" -ldflags "-linkmode=external -X github.com/vektra/mockery/mockery.SemVer=$pkgver" ./cmd/"$_pkgname"
}

check() {
  cd "$_pkgname-$pkgver"
  go test -short ./...
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 bin/"$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
