# Maintainer: Kasimir Wansing <kasimir at wansing dot org>
pkgname=ulist
pkgver=0.12.1
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
sha256sums=('168fd0ab1ea18ed235f865d900dc1ae1bcc3ed0d30d96ecc91b23dbf1781823f')

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
