# Maintainer: ml <ml@visu.li>
pkgname=spruce
pkgver=1.30.0
pkgrel=1
pkgdesc='General purpose YAML/JSON merging tool'
arch=('x86_64')
url='https://github.com/geofffranks/spruce'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8e370a85a2590b16b6b23eadad53b76b5783836f134e6b71f76fa9abe0e42091')

prepare() {
  cd "$pkgname-$pkgver"
  # bad go.mod
  go mod tidy -go=1.18
  go mod vendor
}

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
