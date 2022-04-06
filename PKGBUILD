# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=actionlint
pkgver=1.6.11
pkgrel=1
pkgdesc="Static checker for GitHub Actions workflow files"
arch=('any')
url="https://github.com/rhysd/actionlint"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('039c5f0132952723c634878a0d8c3d2361ea0587647cf0fce39d804375ed41b7')

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
