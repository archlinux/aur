# Maintainer: ml <ml@visu.li>
pkgname=spruce
pkgver=1.29.0
pkgrel=1
pkgdesc='General purpose YAML/JSON merging tool'
arch=('x86_64')
url='https://github.com/geofffranks/spruce'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('357515c5e516f70b644c8fe947105ade6bc30169981196d80305bb816df6753f')

prepare() {
  cd "$pkgname-$pkgver"
  # bad go.mod
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
