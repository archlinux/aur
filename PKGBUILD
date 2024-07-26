# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=imposm
_gitname=imposm3
pkgver=0.14.0
pkgrel=1
pkgdesc="Imports OpenStreetMap data into PostGIS"
arch=('x86_64')
url="https://github.com/omniscale/$_gitname"
license=('Apache')
depends=('geos' 'leveldb')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omniscale/$_gitname/archive/v$pkgver.tar.gz")
sha256sums=('d6b012497eff1b8faa25d125ce0becb97f68c95a68dd2c35cf65a0bf3c34b833')

_importpath="github.com/omniscale/$_gitname"

prepare() {
  cd "$_gitname-$pkgver"
  go mod download
}

build() {
  cd "$_gitname-$pkgver/cmd/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags="-X github.com/omniscale/imposm3.Version=$pkgver"
}

check() {
  cd "$_gitname-$pkgver"
  go test $(go list ./... | grep --invert-match \/test)
  # TODO go test $(go list ./...)
}

package() {
  cd "$srcdir/$_gitname-$pkgver/cmd/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname" "$pkgdir/usr/bin/imposm"
}
