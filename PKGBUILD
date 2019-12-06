# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=imposm
_gitname=imposm3
pkgver=0.10.0
pkgrel=1
pkgdesc="Imports OpenStreetMap data into PostGIS"
arch=('x86_64')
url="https://github.com/omniscale/$_gitname"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omniscale/$_gitname/archive/v$pkgver.tar.gz")
depends=('geos' 'leveldb')
makedepends=('go')

_importpath="github.com/omniscale/$_gitname"

prepare() {
  export GOPATH="$srcdir/_go"
  mkdir -p $(dirname "$GOPATH/src/$_importpath")
  ln --symbolic --force --no-target-directory "$srcdir/$_gitname-$pkgver" "$GOPATH/src/$_importpath"
  cd "$GOPATH/src/$_importpath"
}

check() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath"
  go test $(go list ./... | grep --invert-match \/test)
  # TODO go test $(go list ./...)
}

build() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath/cmd/$pkgname"
  go build \
    -gcflags "all=-trimpath=$srcdir" \
    -asmflags "all=-trimpath=$srcdir" \
    -ldflags "-extldflags $LDFLAGS -X github.com/omniscale/imposm3.Version=$pkgver"
}

package() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath/cmd/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname" "$pkgdir/usr/bin/imposm"
}

sha256sums=('42b42745ef10eaeb002b82158925b0466545ec3248aec8161d40e7fd17765ac6')
