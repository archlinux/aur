# Maintainer: Kasimir Wansing <kasimir at wansing dot org>
pkgname=litestream
pkgver=0.3.2
pkgrel=2
pkgdesc='Streaming S3 replication for SQLite.'
arch=('x86_64')
url='https://github.com/benbjohnson/litestream'
license=('GPL')
depends=('glibc')
makedepends=('go')
optdepends=('sqlite')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('b9ce2c395060ebdbdaa0477028213e86267e119cc12b7e86688427868e75d21e')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

# check() {
#   cd "$pkgname-$pkgver"
#   go test ./...
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
