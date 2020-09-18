# Maintainer: ml <ml@visu.li>
pkgname=spruce
pkgver=1.27.0
pkgrel=1
pkgdesc='A BOSH template merge tool'
arch=('x86_64')
url='https://github.com/geofffranks/spruce'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2fdd439ceb11c36447c80d41f6b229df186013dbe0b13fc7dd704d0de475d147')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -ldflags="-linkmode=external -X=main.Version=$pkgver" ./cmd/spruce
}

check() {
  cd "$pkgname-$pkgver"
  go test -ldflags="-linkmode=external -X=main.Version=$pkgver" -short ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm755 doc/* -t "$pkgdir/usr/share/doc/$pkgname"
  cp -a examples -t "$pkgdir/usr/share/doc/$pkgname"
}
