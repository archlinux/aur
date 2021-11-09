# Maintainer: Kasimir Wansing <kasimir at wansing dot org>
pkgname=litestream
pkgver=0.3.6
pkgrel=1
pkgdesc='Streaming S3 replication for SQLite.'
arch=('x86_64')
url='https://github.com/benbjohnson/litestream'
license=('GPL')
depends=('glibc')
makedepends=('go')
optdepends=('sqlite')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('42323c31af2f70891854709dcd56ce7c970ebdb42d563da1bc81d8abc47f434a')

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
