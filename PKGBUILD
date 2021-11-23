# Maintainer: Kasimir Wansing <kasimir at wansing dot org>
pkgname=ulist
pkgver=0.12.0
pkgrel=1
pkgdesc="A mailing list service that keeps it simple."
arch=('x86_64')
url="https://github.com/wansing/$pkgname"
license=('GPL')
depends=('glibc')
makedepends=('go')
optdepends=('sqlite')
source=("$url/archive/v$pkgver.tar.gz")
validpgpkeys=('F433936B030F7FB97F4084E4C7C21DFFE932EF9D')
sha256sums=('dd44af7e01a5cde01948de5991a5b66d101456cb1a5efa929bfe532330259434')

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
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
