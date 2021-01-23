# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=imposm
_gitname=imposm3
pkgver=0.11.1
pkgrel=2
pkgdesc="Imports OpenStreetMap data into PostGIS"
arch=('x86_64')
url="https://github.com/omniscale/$_gitname"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omniscale/$_gitname/archive/v$pkgver.tar.gz" https://patch-diff.githubusercontent.com/raw/omniscale/imposm3/pull/258.patch)
depends=('geos' 'leveldb')
makedepends=('go')

_importpath="github.com/omniscale/$_gitname"

prepare() {
  cd "$srcdir/$_gitname-$pkgver"
  go mod download
  patch -p1 < "$srcdir/258.patch"
}

check() {
  cd "$srcdir/$_gitname-$pkgver"
  go test $(go list ./... | grep --invert-match \/test)
  # TODO go test $(go list ./...)
}

build() {
  cd "$srcdir/$_gitname-$pkgver"
  go build \
    -gcflags "all=-trimpath=$srcdir" \
    -asmflags "all=-trimpath=$srcdir" \
    -ldflags "-extldflags $LDFLAGS -X github.com/omniscale/imposm3.Version=$pkgver"
}

package() {
  cd "$srcdir/$_gitname-$pkgver/cmd/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname" "$pkgdir/usr/bin/imposm"
}

sha256sums=('14045272aa0157dc5fde1cfe885fecc2703f3bf33506603f2922cdf28310ebf0'
            '4f32c2112eb12a5d29b938470afaba8552a0dfdf086372e7246e81c17308df84')
