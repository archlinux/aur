# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=imposm
_gitname=imposm3
pkgver=0.11.1
pkgrel=2
pkgdesc="Imports OpenStreetMap data into PostGIS"
arch=('x86_64')
url="https://github.com/omniscale/$_gitname"
license=('Apache')
depends=('geos' 'leveldb')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omniscale/$_gitname/archive/v$pkgver.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/omniscale/imposm3/pull/258.patch")
sha256sums=('14045272aa0157dc5fde1cfe885fecc2703f3bf33506603f2922cdf28310ebf0'
            '9b00003ce1a1085737a96bd36e510a98351dda46ed40a1be9ab154b3ebb21b01')

_importpath="github.com/omniscale/$_gitname"

prepare() {
  cd "$_gitname-$pkgver"
  go mod download
  patch -p1 < "$srcdir/258.patch"
}

build() {
  cd "$_gitname-$pkgver/cmd/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS=""
  go build \
    -trimpath \
    -modcacherw \
    -buildmode=pie \
    -mod=readonly \
    -ldflags="-linkmode=external -extldflags $LDFLAGS -X github.com/omniscale/imposm3.Version=$pkgver"
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
