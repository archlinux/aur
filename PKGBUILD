# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=actionlint
pkgver=1.6.6
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=('any')
url="https://github.com/rhysd/actionlint"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af5c9e93053c16204d9d92d3dbc7bb3c1cd65f259d294a69e45af45113fd79ad')

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
  go build -o build ./cmd/${pkgname}
}

test() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
