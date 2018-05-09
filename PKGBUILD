# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=imposm
_gitname=imposm3
pkgver=0.6.0ɑ4
_gitver=${pkgver/ɑ/-alpha.}
pkgrel=1
pkgdesc="Imports OpenStreetMap data into PostGIS"
arch=('x86_64')
url="https://github.com/omniscale/$_gitname"
license=('Apache')
source=("https://github.com/omniscale/$_gitname/archive/v$_gitver.tar.gz")
depends=('geos' 'leveldb')
makedepends=('go')

_importpath="github.com/omniscale/$_gitname"

prepare() {
  export GOPATH="$srcdir/_go"
  mkdir -p $(dirname "$GOPATH/src/$_importpath")
  ln --symbolic --force --no-target-directory "$srcdir/$_gitname-$_gitver" "$GOPATH/src/$_importpath"
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
  go build -ldflags "-X github.com/omniscale/imposm3.Version=$_gitver"
}

package() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath/cmd/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname" "$pkgdir/usr/bin/imposm"
}

sha256sums=('00e996b1a7f76a9adece53550587c79601372bee78322a532dcd8bb22b9fc019')
