# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=actionlint
pkgver=1.6.16
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=('any')
url="https://github.com/rhysd/actionlint"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('342a1d441d6e8df8aadeeb74de35ab8437456fde7ae6ff8e1fb790b2f5a9e47e')

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

check() {
  cd "$pkgname-$pkgver"
  go test -v ./ ./scripts/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
