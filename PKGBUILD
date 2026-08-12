# Maintainer: Dylan Delgado <dylan1496@live.com>
# Contributor: ml <ml@visu.li>
pkgname=spruce
pkgver=1.35.16
pkgrel=1
pkgdesc='General purpose YAML/JSON merging tool'
arch=('x86_64')
url='https://github.com/geofffranks/spruce'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e09ca729fd8a328cd25a62ceefafd84114df2c8945cd7bfb25c122e818ac98d1')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=vendor'
  go build -ldflags="-linkmode=external -X=main.Version=$pkgver" ./cmd/spruce
}

check() {
  cd "$pkgname-$pkgver"
  go test -ldflags=-linkmode=external -short ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm755 doc/* -t "$pkgdir/usr/share/doc/$pkgname"
  cp -a examples -t "$pkgdir/usr/share/doc/$pkgname"
}
